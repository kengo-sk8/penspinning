require 'rails_helper'

RSpec.describe "StaticPages", type: :request do

  describe "各ページに行くか確認する" do
    it "Homeページのhttpリクエストは正しいか" do
      get root_path
      expect(response).to have_http_status(200)
    end
  end

end
