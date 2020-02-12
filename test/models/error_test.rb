# == Schema Information
#
# Table name: errors
#
#  id         :bigint           not null, primary key
#  name       :string
#  program_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "test_helper"

class ErrorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
