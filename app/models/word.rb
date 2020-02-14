# == Schema Information
#
# Table name: words
#
#  id         :bigint           not null, primary key
#  about      :string
#  words      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Word < ApplicationRecord
end
