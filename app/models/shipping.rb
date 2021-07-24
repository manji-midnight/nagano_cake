class Shipping < ApplicationRecord
  belongs_to :customer
  def shipping_address
    self.postcode + self.address + self.name
  end
end