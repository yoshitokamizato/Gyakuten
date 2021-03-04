module GenreSearch
  extend ActiveSupport::Concern

  included do
    scope :search_group, ->(code_name) { joins(:genre).where(genres: { code_name: code_name }).order("genres.position ASC").order(:position) }

    scope :front_group, -> { search_group(Genre::FRONT) }
    scope :ruby_group, -> { search_group(Genre::RUBY) }
    scope :general_group, -> { search_group(Genre::GENERAL) }
    scope :live_group, -> { joins(:genre).where(genres: { code_name: Genre::LIVE }).order("genres.position ASC").order(created_at: :desc) }
  end
end
