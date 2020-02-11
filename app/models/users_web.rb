# == Schema Information
#
# Table name: users_webs
#
#  id         :bigint           not null, primary key
#  url        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#  genre      :string
#

class UsersWeb < ApplicationRecord
  validates :name ,presence: true
  validates :genre ,presence: true
  validates :url, uniqueness: true, presence: true
end
