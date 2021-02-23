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
  # CONVERT_LIST = {
  #   "Front" => 1,
  #   "Ruby" => 2,
  #   "PHP" => 3,
  #   "React" => 4,
  #   "Vue" => 5,
  #   "Angular" => 6,
  #   "AWS" => 7,
  #   "Live" => 8,
  #   "Money" => 9,
  #   "Other" => 10
  # }

  has_many :genres, dependent: :destroy
  validates :title, presence: true
end
