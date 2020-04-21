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

class Aw < ApplicationRecord
end
