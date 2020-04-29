# == Schema Information
#
# Table name: movies
#
#  id         :bigint           not null, primary key
#  contents   :text
#  desc       :text
#  genre      :string
#  title      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :movie do
    sequence(:title) {|n| "#{n}_#{Faker::University.name}" }
    sequence(:contents) {|n| "#{n}_#{Faker::Commerce.department}" }
    sequence(:genre) {|n| "#{n}_#{Faker::Business.credit_card_type}" }
  end
end
