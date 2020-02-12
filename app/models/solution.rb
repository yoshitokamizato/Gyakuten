# == Schema Information
#
# Table name: solutions
#
#  id          :bigint           not null, primary key
#  question_id :integer          not null
#  content     :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Solution < ApplicationRecord
  belongs_to :question
  validates :content, presence: { message: "【回答】は空欄にできません" }
end
