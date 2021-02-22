# == Schema Information
#
# Table name: genres
#
#  id             :bigint           not null, primary key
#  color          :string
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
  COLOR_REGEX = /\A#[0-9a-f]{6}\z/
  belongs_to :genre_group
  validates :title, presence: true
  validates :color, format: { with: COLOR_REGEX }
end
