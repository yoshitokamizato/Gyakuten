# == Schema Information
#
# Table name: errors
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  program_id :integer
#

class Error < ApplicationRecord
end
