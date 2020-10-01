# == Schema Information
#
# Table name: read_texts
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  text_id    :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_read_texts_on_user_id_and_text_id  (user_id,text_id) UNIQUE
#
require "rails_helper"

RSpec.describe ReadText, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
