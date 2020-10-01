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
  has_many :read_texts, dependent: :destroy
  has_many :movies

  PER_PAGE = 10

  PROGRAMMING = ["Basic", "Git", "HTML&CSS", "Ruby", "Ruby on Rails"]
  ALL_PROGRAMMING = PROGRAMMING + ["Php"]

  def self.show_contents_list
    Text.where(genre: PROGRAMMING).order(:position)
  end

  def self.all_show_contents_list
    Text.where(genre: ALL_PROGRAMMING).order(:position)
  end
end
