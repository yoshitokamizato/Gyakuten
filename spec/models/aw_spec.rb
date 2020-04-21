# == Schema Information
#
# Table name: aws
#
#  id         :bigint           not null, primary key
#  contents   :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "rails_helper"

RSpec.describe Aw, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
