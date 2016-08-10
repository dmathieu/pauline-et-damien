require 'rails_helper'

RSpec.describe "Main page", type: :request do
  describe "GET /" do
    it "renders the home page" do
      get root_path
      expect(response).to have_http_status(200)
    end
  end
end
