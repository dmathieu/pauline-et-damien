class Present < ApplicationRecord

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
end
