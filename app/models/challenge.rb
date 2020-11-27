class Challenge < ApplicationRecord
  validates :title, presence: true
  validates :question, presence: true
end
