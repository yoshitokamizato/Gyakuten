# == Schema Information
#
# Table name: genre_groups
#
#  id         :bigint           not null, primary key
#  position   :integer
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "rails_helper"

RSpec.describe GenreGroup, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end