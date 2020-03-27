# == Schema Information
#
# Table name: movies
#
#  id         :bigint           not null, primary key
#  title      :text
#  contents   :text
#  desc       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  genre      :string
#

class Movie < ApplicationRecord
  validates :title, presence: true
  validates :contents, presence: true
  validates :genre, presence: true

  # 1ページの動画表示件数を指定
  PER_PAGE = 10
  # ナビゲーションバーで特に指定しない動画のジャンルをまとめて格納
  PROGRAMMING = ["Basic", "Git", "Ruby", "Ruby on Rails"].freeze

  def self.categorized_by(genre, page:)
    case genre
    when "Money", "Movie", "Writing", "Php", "Marketing"
      self.where(genre: genre).order("id ASC").page(page).per(PER_PAGE)
    when "Salon", "Talk", "Live"
      self.where(genre: genre).order("id DESC").page(page).per(PER_PAGE)
    else
      self.where(genre: PROGRAMMING).order("id ASC").page(page).per(PER_PAGE)
    end
  end
end
