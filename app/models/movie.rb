class Movie < ApplicationRecord

  PER_PAGE = 10
  PROGRAMMING = ["Basic", "git", "Ruby", "Ruby on Rails", "AWS"]

  def self.count_level(page)
    page ? ((page.to_i * PER_PAGE) - (PER_PAGE - 1)) : 1
  end

  def self.disp_programming(page)
    Movie.where(genre: PROGRAMMING).order('id ASC').page(page).per(PER_PAGE)
  end

  def self.disp_money(page)
    Movie.where(genre: "Money").order('id ASC').page(page).per(PER_PAGE)
  end

  def self.disp_salon(page)
    Movie.where(genre: "Salon").order("id DESC").page(page).per(PER_PAGE)
  end

  def self.disp_talks(page)
    Movie.where(genre: "Talk").order("id DESC").page(page).per(PER_PAGE)
  end

  def self.disp_lives(page)
    Movie.where(genre: "Live").order("id DESC").page(page).per(PER_PAGE)
  end

end
