# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  name                   :string
#  program_id             :integer
#  error_id               :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#

require 'rails_helper'

RSpec.describe User, type: :model do
  it "ユーザの名前が取得できること" do
    disp_name = User.disp_name("satou")
    expect(disp_name).to eq "satouさん"
  end
end
