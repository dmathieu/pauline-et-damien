class Payment < ApplicationRecord
  belongs_to :present

  validates :name,
    presence: true
  validates :amount_cent,
    presence: true,
    numericality: {
      greater_than: 0,
      only_integer: true
    }
  validates :present,
    presence: true

  def amount=(value)
    self.amount_cent = value.to_i*100
  end

  def amount
    (self.amount_cent || 0)/100
  end
end
