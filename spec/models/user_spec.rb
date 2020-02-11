require "rails_helper"

RSpec.describe User, type: :model do
  it "ユーザの名前が取得できること" do
    disp_name = User.disp_name("satou")
    expect(disp_name).to eq "satouさん"
  end
end
