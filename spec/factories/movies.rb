# == Schema Information
#
# Table name: movies
#
#  id         :bigint           not null, primary key
#  desc       :text
#  genre      :string
#  position   :integer
#  title      :text
#  url        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  text_id    :integer
#

FactoryBot.define do
  factory :movie do
    sequence(:title) {|n| "#{n}_#{Faker::University.name}" }
    sequence(:url) {|n| "#{n}_#{Faker::Commerce.department}" }
    sequence(:genre) {|n| "#{n}_#{Faker::Business.credit_card_type}" }
  end
end
