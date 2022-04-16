require 'rails_helper'

RSpec.describe "Libraries", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/libraries/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/libraries/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/libraries/new"
      expect(response).to have_http_status(:success)
    end
  end

end
