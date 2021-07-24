class CartProduct < ApplicationRecord
    belongs_to :customer
    belongs_to :product

  def sum_of_price
    product.add_tax_price * quantity
  end
end
