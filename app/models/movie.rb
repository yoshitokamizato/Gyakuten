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
#

class Movie < ApplicationRecord
  acts_as_list
  validates :title, presence: true
  validates :contents, presence: true
  validates :genre, presence: true

  # 1ページの動画表示件数を指定
  PER_PAGE = 10
  # ナビゲーションバーで特に指定しない動画のジャンルをまとめて格納
  GENRE = ["Basic", "Git", "Ruby", "Ruby on Rails", "Money", "Design", "Live", "Talk", "Php", "Writing", "Marketing", "Movie"].freeze

  def self.categorized_by(genre, page:)
    case genre
    when "Money", "Movie", "Writing", "Php", "Marketing"
      self.where(genre: genre).order("id ASC").page(page).per(PER_PAGE)
    when "Salon", "Talk", "Live"
      self.where(genre: genre).order("id DESC").page(page).per(PER_PAGE)
    else
      self.where(genre: GENRE).order(:position).page(page).per(PER_PAGE)
    end
  end

  def self.show_contents_list
    Movie.where(genre: GENRE).order(:position)
  end
end
