# == Schema Information
#
# Table name: genre_groups
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class GenreGroup < ApplicationRecord
  has_many :genres, dependent: :destroy
  validates :title, presence: true
end
