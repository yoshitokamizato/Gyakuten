class Question < ApplicationRecord
  def self.build_and_count_up(id)
    question = Question.find(id)
    question.record_timestamps = false
    question.count += 1
    question.save
    question.record_timestamps = true

    question
  end
end
