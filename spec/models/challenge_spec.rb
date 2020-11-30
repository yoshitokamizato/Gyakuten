# == Schema Information
#
# Table name: challenges
#
#  id         :bigint           not null, primary key
#  hint       :text
#  image      :string
#  position   :integer
#  question   :text             not null
#  theme      :string           not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "rails_helper"

RSpec.describe Challenge, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
