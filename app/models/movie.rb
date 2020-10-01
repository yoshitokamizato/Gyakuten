# == Schema Information
#
# Table name: movies
#
#  id         :bigint           not null, primary key
#  contents   :text
#  desc       :text
#  genre      :string
#  position   :integer
#  title      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  text_id    :integer
#

class Movie < ApplicationRecord
  acts_as_list
  validates :title, presence: true
  validates :contents, presence: true
  validates :genre, presence: true
  has_many :watched_movies, dependent: :destroy
  belongs_to :text, optional: true

  # 1ページの動画表示件数を指定
  PER_PAGE = 18
  # ナビゲーションバーで特に指定しない動画のジャンルをまとめて格納
  PROGRAMMING = Text::PROGRAMMING
  LIVE = ["Salon", "Talk", "Live"].freeze
  GENERAL = ["Movie", "Writing", "Php", "Marketing", "Design", "Other", "Money"].freeze

  def self.categorized_by(genre, page:)
    case genre
    when *GENERAL
      self.where(genre: genre).order(:position).page(page).per(PER_PAGE)
    when *LIVE
      # 「ライブコーディング」「対談」は新規投稿順
      self.where(genre: genre).order(id: :desc).page(page).per(PER_PAGE)
    else
      self.where(genre: PROGRAMMING).order(:position).page(page).per(PER_PAGE)
    end
  end

  def self.watched_movie_data(user)
    # 読破済みのデータを取得
    watched_movies_count_data = user.watched_through_movies.pluck(:genre).group_by(&:itself).transform_values(&:size)

    Text.pluck(:genre).group_by(&:itself).transform_values do |array|
      key = array.first
      total_count = array.size
      current_count = watched_movies_count_data[key] || 0
      {
        total: total_count,
        current: current_count,
        percent: current_count * 100 / total_count
      }
    end
  end
end
