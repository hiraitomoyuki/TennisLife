require 'rails_helper'

RSpec.describe "Circles", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/circles/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/circles/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/circles/edit"
      expect(response).to have_http_status(:success)
    end
  end
end