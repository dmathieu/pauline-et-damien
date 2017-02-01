require 'rails_helper'

RSpec.describe "Admin page", type: :request do
  describe "GET /admin" do
    it "renders the admin page" do
      get admin_root_path, params: {admin: true}
      expect(response).to have_http_status(200)
    end

    it "rejects access for non-admins" do
      get admin_root_path
      expect(response).to have_http_status(401)
    end
  end
end
