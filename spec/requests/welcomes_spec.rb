require 'rails_helper'

RSpec.describe "Main page", type: :request do
  describe "GET /" do
    it "renders the home page" do
      get root_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /logements" do
    it "renders the accomodations page" do
      get logements_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /venir" do
    it "renders the location page" do
      get venir_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /liste-mariage" do
    it "renders the liste de mariage page" do
      get liste_mariage_path
      expect(response).to have_http_status(200)
    end
  end
end
