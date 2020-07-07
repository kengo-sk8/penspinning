require 'rails_helper'

RSpec.describe "StaticPages", type: :request do

  describe "GET /help" do
    it "returns http success" do
      get "/static_pages/help"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /inquiry" do
    it "returns http success" do
      get "/static_pages/inquiry"
      expect(response).to have_http_status(:success)
    end
  end

end
