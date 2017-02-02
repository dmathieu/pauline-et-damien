require 'rails_helper'

RSpec.describe "Admin presents page", type: :request do
  let(:present) { create(:present) }

  before do
    present
  end

  describe "GET /admin/presents" do
    it "renders the presents main page" do
      get admin_presents_path, params: {user_email: User::VALID_EMAILS.first}
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /admin/presents/new" do
    it "renders the new present page" do
      get new_admin_present_path, params: {user_email: User::VALID_EMAILS.first}
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /admin/presents/:id/edit" do
    it "renders the edit present page" do
      get edit_admin_present_path(present), params: {user_email: User::VALID_EMAILS.first}
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /admin/presents" do
    it "creates a new present" do
      expect do
        post admin_presents_path, params: {
          present: {
            title: "New present",
            description: "test",
            price: "3",
            photo: Rack::Test::UploadedFile.new(File.open("spec/fixtures/image.png"))
          }, user_email: User::VALID_EMAILS.first
        }
        expect(response).to have_http_status(302)
      end.to change(Present, :count).by(1)
    end
  end

  describe "PUT /admin/presents/:id" do
    it "updates an existing present" do
      expect do
        put admin_present_path(present), params: {
          present: {
            title: "Edited present",
          }, user_email: User::VALID_EMAILS.first
        }
        expect(response).to have_http_status(302)
      end.to change(Present, :count).by(0)

      expect(present.reload.title).to eql("Edited present")
    end
  end

  describe "DELETE /admin/presents/:id" do
    it "destroys an existing present" do
      expect do
        delete admin_present_path(present), params: {user_email: User::VALID_EMAILS.first}
        expect(response).to have_http_status(302)
      end.to change(Present, :count).by(-1)
    end
  end
end
