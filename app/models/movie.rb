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

  def self.categorize(content_name, page)
    case content_name
    when "Money", "Movie", "Writing", "Php" then
      self.where(genre: content_name).order("id ASC").page(page).per(PER_PAGE)
    when "Salon", "Talk", "Live" then
      self.where(genre: content_name).order("id DESC").page(page).per(PER_PAGE)
    else
      self.where(genre: PROGRAMMING).order("id ASC").page(page).per(PER_PAGE)
    end
  end
end
