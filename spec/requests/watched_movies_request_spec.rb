require 'rails_helper'

RSpec.describe "WatchedMovies", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/watched_movies/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/watched_movies/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
