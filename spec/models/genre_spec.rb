# == Schema Information
#
# Table name: genres
#
#  id         :bigint           not null, primary key
#  color      :string
#  position   :integer
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "rails_helper"

RSpec.describe Genre, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
