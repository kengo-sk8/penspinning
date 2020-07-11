require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do


  describe "ページ遷移確認" do
    it "aboutのページに遷移できること" do
      get "about"
      expect(response).to have_http_status(:success)
    end

    it "inquiryのページに遷移できること" do
      get "inquiry"
      expect(response).to have_http_status(:success)
    end

    it "contactのページに遷移できること" do
      get "contact"
      expect(response).to have_http_status(:success)
    end
  end
end
