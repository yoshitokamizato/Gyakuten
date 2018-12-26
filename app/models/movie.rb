class Movie < ApplicationRecord

  PER_PAGE = 10

  def self.count_level(page)
    page ? ((page.to_i * PER_PAGE) - (PER_PAGE - 1)) : 1
  end

  def self.disp_programming_movie(page)
    Movie.where(genre: ["Basic", "Git", "Ruby", "Ruby on Rails"]).page(page).per(PER_PAGE)
  end

end
