# == Schema Information
#
# Table name: texts
#
#  id          :bigint           not null, primary key
#  contents    :text
#  description :string
#  genre       :string
#  image       :string
#  position    :integer
#  title       :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Text < ApplicationRecord
  acts_as_list
  mount_uploader :image, ImageUploader
  has_many :read_texts, dependent: :destroy
  has_many :movies

  PER_PAGE = 10

  PROGRAMMING = ["Basic", "Git", "Ruby", "Ruby on Rails"].freeze
  OTHER_PROGRAMMING = %w[PHP AWS HTML&CSS JavaScript TypeScript Vue Angular].freeze
  ALL_PROGRAMMING = PROGRAMMING + OTHER_PROGRAMMING

  def self.show_contents_list
    Text.where(genre: PROGRAMMING).order(:position)
  end

  def self.all_show_contents_list
    Text.where(genre: ALL_PROGRAMMING).order(:position)
  end

  def self.read_text_data(user)
    # 読破済みのデータを取得
    read_texts_count_data = user.read_through_texts.where(genre: ALL_PROGRAMMING).pluck(:genre).group_by(&:itself).transform_values(&:size)
    texts_count_data = Text.where(genre: ALL_PROGRAMMING).pluck(:genre).group_by(&:itself).transform_values(&:size)
    ALL_PROGRAMMING.map do |genre|
      total_count = texts_count_data[genre] || 0
      current_count = read_texts_count_data[genre] || 0
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
