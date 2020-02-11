class Marketing < ApplicationRecord
  PER_PAGE = 10

  def self.count_level(page)
    page ? ((page.to_i * PER_PAGE) - (PER_PAGE - 1)) : 1
  end

  def self.search_all_movie(page)
    Marketing.all.order("id ASC").page(page).per(PER_PAGE)
  end
end
