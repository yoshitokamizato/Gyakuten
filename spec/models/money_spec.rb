# == Schema Information
#
# Table name: money
#
#  id         :bigint           not null, primary key
#  genre      :string
#  title      :string
#  contents   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Money, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
