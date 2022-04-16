require 'rails_helper'

RSpec.describe "Practices", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/practices/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/practices/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/practices/new"
      expect(response).to have_http_status(:success)
    end
  end

end
