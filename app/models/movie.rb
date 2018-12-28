class Movie < ApplicationRecord

  PER_PAGE = 10
  PROGRAMMING = ["Basic", "Git", "Ruby", "Ruby on Rails"]

  def self.count_level(page)
    page ? ((page.to_i * PER_PAGE) - (PER_PAGE - 1)) : 1
  end

  def self.disp_programming(page)
    Movie.where(genre: PROGRAMMING).page(page).per(PER_PAGE)
  end

  def self.disp_money(page)
    Movie.where(genre: "Money").page(page).per(PER_PAGE)
  end

  def self.disp_design(page)
    Movie.where(genre: "Design").page(page).per(PER_PAGE)
  end

end
