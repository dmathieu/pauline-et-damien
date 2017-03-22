class Present < ApplicationRecord

  has_many :payments
  mount_uploader :photo, PhotoUploader

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
  validates :photo,
    presence: true

  def price=(value)
    self.price_cent = value.to_i*100
  end

  def price
    (self.price_cent || 0)/100
  end

  def remaining
    remaining_cent/100
  end

  def finished?
    remaining <= 0
  end

  private
  def remaining_cent
    self.price_cent - payments.inject(0){|s,p| s + p.amount_cent }
  end
end
