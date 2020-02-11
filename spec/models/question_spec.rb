# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  title      :string
#  details    :text
#  solution   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  count      :integer          default(0)
#

require 'rails_helper'

RSpec.describe Question, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
