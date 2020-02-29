# == Schema Information
#
# Table name: texts
#
#  id            :bigint           not null, primary key
#  contents      :text
#  description   :string
#  genre         :string
#  title         :text
#  twitter_image :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Text < ApplicationRecord
  has_one_attached :image
  PER_PAGE = 10
  PROGRAMMING = ["Basic", "git", "Ruby", "Ruby on Rails"].freeze

  def self.show_contents_list
    Text.where(genre: PROGRAMMING).order("id ASC")
  end
end
