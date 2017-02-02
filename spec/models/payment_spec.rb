require 'rails_helper'

RSpec.describe Payment, type: :model do

  it "creates a payment" do
    create(:payment)
  end

  describe "name" do
    it "rejects creating a payment with an empty name" do
      expect do
        create(:payment, name: "")
      end.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Name can't be blank")
    end
  end

  describe "present" do
    it "rejects creating a payment without a present" do
      expect do
        create(:payment, present_id: 42)
      end.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Present must exist, Present can't be blank")
    end
  end

  describe "amount_cent" do
    it "rejects creating a payment without a price" do
      expect do
        create(:payment, amount_cent: nil)
      end.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Amount cent can't be blank, Amount cent is not a number")
    end

    it "rejects creating a payment with a negative price" do
      expect do
        create(:payment, amount_cent: -5)
      end.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Amount cent must be greater than 0")
    end

    it "rejects creating a payment with a float price" do
      expect do
        create(:payment, amount_cent: 2.5)
      end.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Amount cent must be an integer")
    end
  end
end
