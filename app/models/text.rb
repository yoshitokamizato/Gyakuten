class Text < ApplicationRecord
  PER_PAGE = 10
  PROGRAMMING = ["Basic", "git", "Ruby", "Ruby on Rails"]

  def self.show_contents_list
    Text.where(genre: PROGRAMMING).order('id ASC')
  end

end
