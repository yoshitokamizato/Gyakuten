require 'rails_helper'

RSpec.describe "ReadTexts", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/read_texts/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/read_texts/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
