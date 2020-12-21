# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  body       :text
#  genre      :string
#  solution   :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
  validates :genre, presence: true
  validates :title, presence: true
  validates :body, presence: true
  validates :solution, presence: true
end
