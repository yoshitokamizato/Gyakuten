# == Schema Information
#
# Table name: genres
#
#  id             :bigint           not null, primary key
#  color          :string
#  title          :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  genre_group_id :bigint           not null
#
# Indexes
#
#  index_genres_on_genre_group_id  (genre_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (genre_group_id => genre_groups.id)
#
require "rails_helper"

RSpec.describe Genre, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
