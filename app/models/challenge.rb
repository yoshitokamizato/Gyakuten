# == Schema Information
#
# Table name: challenges
#
#  id         :bigint           not null, primary key
#  hint       :text
#  image      :string
#  question   :text             not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Challenge < ApplicationRecord
  validates :title, presence: true
  validates :question, presence: true
  has_many :complete_challenges, dependent: :destroy
end
