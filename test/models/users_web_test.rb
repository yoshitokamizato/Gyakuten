# == Schema Information
#
# Table name: users_webs
#
#  id         :bigint           not null, primary key
#  url        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#  genre      :string
#

require 'test_helper'

class UsersWebTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
