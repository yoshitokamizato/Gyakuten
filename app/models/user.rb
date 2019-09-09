class User < ApplicationRecord
  has_many :questions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.disp_name(name = "tanaka")
    user = User.new(name: name)
    "#{user.name}さん"
  end
end
