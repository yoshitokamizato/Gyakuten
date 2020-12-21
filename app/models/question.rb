# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  title      :string
#  details    :text
#  solution   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  count      :integer          default(0)
#

class Question < ApplicationRecord
  validates :title, presence: { message: "【質問】は空欄にできません" }
  validates :details, presence: { message: "【詳細】は空欄にできません" }

  def self.build_and_count_up(id)
    question = Question.find(id)
    question.record_timestamps = false
    question.count += 1
    question.save!
    question.record_timestamps = true

    question
  end
end
