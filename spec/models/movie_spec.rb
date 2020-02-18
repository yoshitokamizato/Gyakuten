require 'rails_helper'

RSpec.describe Movie, type: :model do
  context "title と contents と genre が存在するとき" do
    it "動画の記事が作られる" do
      movie = create(:movie)
      expect(movie).to be_valid
    end
  end

  context "title が存在しないとき" do
    it "エラーする" do
      movie = build(:movie, title: nil)
      movie.valid?
      expect(movie.errors.messages[:title]).to include "を入力してください"
    end
  end

  context "contents が存在しないとき" do
    it "エラーする" do
      movie = build(:movie, contents: nil)
      movie.valid?
      expect(movie.errors.messages[:contents]).to include "を入力してください"
    end
  end

  context "genre が存在しないとき" do
    it "エラーする" do
      movie = build(:movie, genre: nil)
      movie.valid?
      expect(movie.errors.messages[:genre]).to include "を入力してください"
    end
  end
end