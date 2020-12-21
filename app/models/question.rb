# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  details    :text
#  genre      :string
#  solution   :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
  validates :title, presence: { message: "【質問】は空欄にできません" }
  validates :details, presence: { message: "【詳細】は空欄にできません" }
end
