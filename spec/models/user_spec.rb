require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe "find_or_create" do
    it "creates a user" do
      expect do
        User.find_or_create("john@doe.com")
      end.to change(User, :count).by(1)
    end

    it "finds a user" do
      user

      expect do
        User.find_or_create(user.email)
      end.to change(User, :count).by(0)
    end
  end

  describe "admin?" do
    it "is admin" do
      expect(user).to be_admin
    end

    it "is not admin" do
      expect(create(:user, email: "john@doe.com")).not_to be_admin
    end
  end

  describe "#guest?" do
    it "is not guest" do
      expect(user).not_to be_guest
    end

    it "is guest" do
      expect(User.new).to be_guest
    end
  end
end
