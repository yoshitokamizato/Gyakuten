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
  PROGRAMMING = Settings.programming.rails.split(", ").freeze
  LIVE = Settings.programming.live.split(", ").freeze
  GENERAL = Settings.programming.general.split(", ").freeze

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
end
