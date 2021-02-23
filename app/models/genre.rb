# == Schema Information
#
# Table name: genres
#
#  id             :bigint           not null, primary key
#  color          :string
#  position       :integer
#  title          :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  genre_group_id :bigint           not null
#
# Indexes
#
#  index_genres_on_genre_group_id  (genre_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (genre_group_id => genre_groups.id)
#
class Genre < ApplicationRecord
  CONVERT_LIST = {
    # "Basic" => 1,
    # "Git" => 2,
    # "Ruby" => 3,
    # "Rails" => 4,
    "PHP" => 5,
    "HTML&CSS" => 6,
    "JavaScript" => 7,
    "TypeScript" => 8,
    "React" => 9,
    "Vue" => 10,
    "Angular" => 11,
    "AWS" => 12,
    "Money" => 13,
    "Talk" => 14,
    "Live" => 15,
    # "Other" => 16,
  }

  acts_as_list
  COLOR_REGEX = /\A#[0-9a-f]{6}\z/
  validates :title, presence: true
  validates :color, format: { with: COLOR_REGEX }

  belongs_to :genre_group
  has_many :movies
  has_many :texts
  has_many :questions

  scope :front, -> { where(genre_group_id: 1).order(:position) }
  scope :ruby, -> { where(genre_group_id: 2).order(:position) }
  scope :php, -> { where(genre_group_id: 3).order(:position) }
  scope :react, -> { where(genre_group_id: 4).order(:position) }
  scope :vue, -> { where(genre_group_id: 5).order(:position) }
  scope :angular, -> { where(genre_group_id: 6).order(:position) }
  scope :aws, -> { where(genre_group_id: 7).order(:position) }

  scope :general, -> { where.not(genre_group_id: 8..10).order(:position) }
  scope :live, -> { where(genre_group_id: 8..9).order(:position) }

  scope :others, -> { where(genre_group_id: 10).order(:position) }
  scope :display, -> { where.not(genre_group_id: 10).order(:position) }

  def self.permit_genre(genre)
    self::CONVERT_LIST.keys.include?(genre)
  end

  scope :search_ids, ->(genre) {
    permit_genre(genre) ? [Genre::CONVERT_LIST[genre]] : Genre.ruby.ids
  }

  scope :search_genre, ->(genre) {
    permit_genre(genre) ? Genre.find(Genre::CONVERT_LIST[genre]).title : "Ruby"
  }

  def self.personal_data(completed_count_data, count_data)
    genres = Genre.where(id: count_data.keys).order(:position)
    genres.map do |genre|
      total_count = count_data[genre.id] || 0
      current_count = completed_count_data[genre.id] || 0
      percent = total_count.zero? ? 0 : current_count * 100 / total_count
      {
        genre: genre.title,
        color: genre.color,
        total: total_count,
        current: current_count,
        percent: percent,
      }
    end
  end
end
