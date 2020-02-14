# == Schema Information
#
# Table name: movies
#
#  id         :bigint           not null, primary key
#  title      :text
#  contents   :text
#  desc       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  genre      :string
#

require "test_helper"

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
