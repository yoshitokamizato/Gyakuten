# == Schema Information
#
# Table name: marketings
#
#  id         :bigint           not null, primary key
#  genre      :string
#  title      :text
#  contents   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "rails_helper"

RSpec.describe Marketing, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
