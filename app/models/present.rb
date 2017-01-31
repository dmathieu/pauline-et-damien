class Present < ApplicationRecord

  has_many :payments

  validates :title,
    presence: true
  validates :description,
    presence: true
  validates :price_cent,
    presence: true,
    numericality: {
      greater_than: 0,
      only_integer: true
    }

  def price=(value)
    self.price_cent = value*100
  end

  def price
    self.price_cent/100
  end

  def remaining
    remaining_cent/100
  end

  private
  def remaining_cent
    self.price_cent - payments.sum(:amount_cent)
  end
end
