# == Schema Information
#
# Table name: lines
#
#  id         :bigint           not null, primary key
#  genre      :string
#  title      :string
#  contents   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class LineTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
