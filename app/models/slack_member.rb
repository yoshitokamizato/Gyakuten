# == Schema Information
#
# Table name: slack_members
#
#  id          :bigint           not null, primary key
#  displayname :string
#  fullname    :string
#  genre       :string           not null
#  status      :string           not null
#  userid      :string           not null
#  username    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_slack_members_on_userid  (userid) UNIQUE
#
class SlackMember < ApplicationRecord
  validates :userid, presence: true, uniqueness: true
  validates :genre, presence: true, inclusion: { in: %w[gyakuten yanbaru_code yanbaru_expert] }
  validates :status, presence: true
end
