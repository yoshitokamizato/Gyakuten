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
# Indexes
#
#  index_errors_on_program_id  (program_id)
#

class Error < ApplicationRecord
end
