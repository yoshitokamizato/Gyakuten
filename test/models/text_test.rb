# == Schema Information
#
# Table name: texts
#
#  id         :bigint           not null, primary key
#  genre      :string
#  title      :text
#  contents   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TextTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
