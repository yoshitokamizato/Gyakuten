# == Schema Information
#
# Table name: faqs
#
#  id         :bigint           not null, primary key
#  answer     :string
#  position   :integer
#  question   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :faq do
    question { "MyString" }
    answer { "MyString" }
  end
end
