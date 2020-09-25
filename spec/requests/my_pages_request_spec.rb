require 'rails_helper'

RSpec.describe "MyPages", type: :request do

  describe "GET /show" do
    it "returns http success" do
      get "/my_pages/show"
      expect(response).to have_http_status(:success)
    end
  end

end
