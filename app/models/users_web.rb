class UsersWeb < ApplicationRecord
  validates :name, presence: true
  validates :genre, presence: true
  validates :url, uniqueness: true, presence: true
end
