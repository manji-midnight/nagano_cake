class Customer < ApplicationRecord
  has_many :cart_products
  has_many :orders
  has_many :shippings
end
