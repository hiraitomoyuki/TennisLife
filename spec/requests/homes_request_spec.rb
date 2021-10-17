require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "トップページ" do
    it "トップページが表示される" do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end
end