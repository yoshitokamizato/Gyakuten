# == Schema Information
#
# Table name: lines
#
#  id         :bigint           not null, primary key
#  genre      :string
#  title      :string
#  contents   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Line < ApplicationRecord
end
