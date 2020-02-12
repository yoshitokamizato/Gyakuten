# == Schema Information
#
# Table name: texts
#
#  id         :bigint           not null, primary key
#  genre      :string
#  title      :text
#  contents   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Text < ApplicationRecord
  PER_PAGE = 10
  PROGRAMMING = ["Basic", "git", "Ruby", "Ruby on Rails"].freeze

  def self.show_contents_list
    Text.where(genre: PROGRAMMING).order("id ASC")
  end
end
