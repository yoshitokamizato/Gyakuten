module GenreSearch
  extend ActiveSupport::Concern

  included do
    scope :front_group, -> { where(genre_id: Genre.front).order(:genre_id) }
    scope :ruby_group, -> { where(genre_id: Genre.ruby).order(:genre_id) }
    scope :php_group, -> { where(genre_id: Genre.php).order(:genre_id) }
    scope :react_group, -> { where(genre_id: Genre.react).order(:genre_id) }
    scope :vue_group, -> { where(genre_id: Genre.vue).order(:genre_id) }
    scope :angular_group, -> { where(genre_id: Genre.angular).order(:genre_id) }
    scope :aws_group, -> { where(genre_id: Genre.aws).order(:genre_id) }

    scope :general_group, -> { where.(genre_id: Genre.general).order(:genre_id) }
    scope :live_group, -> { where(genre_id: Genre.live).order(:genre_id) }

    scope :others_group, -> { where(genre_id: Genre.others).order(:genre_id) }
    scope :display_group, -> { where(genre_id: Genre.display).order(:genre_id) }
  end
end