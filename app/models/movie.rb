# == Schema Information
#
# Table name: movies
#
#  id         :bigint           not null, primary key
#  desc       :text
#  genre      :string
#  position   :integer
#  title      :text
#  url        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  text_id    :integer
#

class Movie < ApplicationRecord
  YOUTUBE_REGEX = %r{\Ahttps://www.youtube.com/embed/[^?&"'>]+\z}
  acts_as_list

  validates :title, presence: true
  validates :url, presence: true
  validates :genre, presence: true
  has_many :watched_movies, dependent: :destroy
  belongs_to :text, optional: true

  # 1ページの動画表示件数を指定
  PER_PAGE = 18
  # ナビゲーションバーで特に指定しない動画のジャンルをまとめて格納
  PROGRAMMING = Text::PROGRAMMING
  LIVE = ["Salon", "Talk", "Live"].freeze
  GENERAL = ["PHP", "Design", "Other", "Money"].freeze
  MYPAGE_LIST = ["Basic", "Git", "Ruby", "Ruby on Rails", "PHP", "Live", "Talk", "Money"].freeze

  before_save do
    format_url = YoutubeUrlFormatter.format(url)
    if format_url.present?
      self.url = format_url
    else
      self.errors.add(:url, "YouTubeのURL以外は無効です")
    end
  end

  def self.categorized_by(genre, page:)
    case genre
    when *GENERAL
      self.where(genre: genre).order(:position).page(page).per(PER_PAGE)
    when *LIVE
      # 「ライブコーディング」「勉強会」は新規投稿順
      self.where(genre: genre).order(id: :desc).page(page).per(PER_PAGE)
    else
      self.where(genre: PROGRAMMING).order(:position).page(page).per(PER_PAGE)
    end
  end

  def self.watched_movie_data(user)
    # 読破済みのデータを取得
    watched_movies_count_data = user.watched_through_movies.pluck(:genre).group_by(&:itself).transform_values(&:size)
    movies_count_data = Movie.where(genre: MYPAGE_LIST).pluck(:genre).group_by(&:itself).transform_values(&:size)

    MYPAGE_LIST.map do |genre|
      total_count = movies_count_data[genre] || 0
      current_count = watched_movies_count_data[genre] || 0
      percent = total_count.zero? ? 0 : current_count * 100 / total_count
      {
        genre: Settings.genre[genre],
        total: total_count,
        current: current_count,
        percent: percent,
      }
    end
  end
end
