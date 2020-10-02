# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  approval_at            :datetime         default(Fri, 02 Oct 2020 14:28:56 JST +09:00)
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  flag                   :boolean          default(FALSE)
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  slack_name             :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  error_id               :integer
#  program_id             :integer
#  slack_id               :string           not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_error_id              (error_id)
#  index_users_on_program_id            (program_id)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_slack_id              (slack_id) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :recoverable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable
  validates :slack_id, presence: true, uniqueness: true
  has_many :watched_movies, dependent: :destroy
  has_many :read_texts, dependent: :destroy
end
