require 'rails_helper'

RSpec.describe Present, type: :model do

  it "creates a present" do
    create(:present)
  end

  describe "title" do
    it "rejects creating a present with an empty title" do
      expect do
        create(:present, title: "")
      end.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Title can't be blank")
    end
  end

  describe "description" do
    it "rejects creating a present with an empty description" do
      expect do
        create(:present, description: "")
      end.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Description can't be blank")
    end
  end

  describe "price_cent" do
    it "rejects creating a present without a price" do
      expect do
        create(:present, price_cent: nil)
      end.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Price cent can't be blank, Price cent is not a number")
    end

    it "rejects creating a present with a negative price" do
      expect do
        create(:present, price_cent: -5)
      end.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Price cent must be greater than 0")
    end

    it "rejects creating a present with a float price" do
      expect do
        create(:present, price_cent: 2.5)
      end.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Price cent must be an integer")
    end
  end

  describe "price" do
    it "returns the price in euro" do
      subject.price_cent = 1000
      expect(subject.price).to equal(10)
    end

    it "sets the price in cent" do
      subject.price = 50
      subject.price_cent = 5000
    end
  end
end
