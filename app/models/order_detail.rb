class OrderDetail < ApplicationRecord
    belongs_to :order
    belongs_to :product

  def sum_of_price
    product.add_tax_price * quantity
  end

end
