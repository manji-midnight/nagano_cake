class OrderDetail < ApplicationRecord
    belongs_to :order
    belongs_to :product

  def sum_of_price
    product.add_tax_price * quantity
  end

  enum production_status: { 着手不可:0, 製作待ち:1, 製作中:2, 製作完了:3 }

end
