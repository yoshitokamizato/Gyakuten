class Solution < ApplicationRecord
  belongs_to :question
  validates :content, presence: { message: "【回答】は空欄にできません" }
end
