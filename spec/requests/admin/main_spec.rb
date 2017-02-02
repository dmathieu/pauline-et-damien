require 'rails_helper'

RSpec.describe "Admin page", type: :request do
  describe "GET /admin" do
    it "redirects to the presents page" do
      get admin_root_path, params: {user_email: User::VALID_EMAILS.first}
      expect(response).to have_http_status(302)
      expect(response.location).to match(/\/admin\/presents$/)
    end

    it "rejects access for non-admins" do
      get admin_root_path
      expect(response).to have_http_status(302)
      expect(response.location).to match(/\/auth\/google_oauth2$/)
    end
  end
end
