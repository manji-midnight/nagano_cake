class Product < ApplicationRecord
    has_many :cart_products
    has_many :order_details
    belongs_to :genre
<<<<<<< HEAD
    attachment :image

    def  add_tax_price
        (self.price * 1.10).round
    end
=======
>>>>>>> 8affcfd854fc6bc220b8b745150afb732a40f124
end
