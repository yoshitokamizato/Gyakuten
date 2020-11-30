require "rails_helper"

RSpec.describe "CompleteChallenges", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/complete_challenges/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/complete_challenges/destroy"
      expect(response).to have_http_status(:success)
    end
  end
end
