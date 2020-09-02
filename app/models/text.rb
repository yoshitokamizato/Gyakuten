# == Schema Information
#
# Table name: texts
#
#  id          :bigint           not null, primary key
#  contents    :text
#  description :string
#  genre       :string
#  position    :integer
#  title       :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Text < ApplicationRecord
  acts_as_list
  has_one_attached :image
  has_many :read_texts, dependent: :destroy
  has_many :movies

  PER_PAGE = 10

  PROGRAMMING = [ Settings.programming.rails,
                  Settings.programming.php].join(", ").split(", ").freeze

  PRIMARY_CONTENTS = Settings.programming.rails.split(", ").freeze

  def self.show_contents_list
    Text.where(genre: PRIMARY_CONTENTS).order(:position)
  end
end
