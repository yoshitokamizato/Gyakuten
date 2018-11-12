require 'rails_helper'

RSpec.describe Content, type: :model do

  # bundle exec rails generate rspec:model Content
  it "オブジェクトが取得できること" do
    movies = Movie.all.order("id ASC")
    texts = Text.all.order("id ASC")
    lines = Line.all.order("id ASC")
    object_list = {movie: movies, text: texts, line: lines}
    objects = Content.build_objects
    expect(objects[:movie].count).to eq object_list[:movie].count
  end

end
