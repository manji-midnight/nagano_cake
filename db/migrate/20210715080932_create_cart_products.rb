class CreateCartProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_products do |t|
<<<<<<< HEAD
      t.integer :customer_id, null: false
      t.integer :product_id, null: false
      t.integer :quantity, :default => 1, null: false
=======
      t.integer :customer_id
      t.integer :product_id
      t.integer :quantity_id
>>>>>>> 8affcfd854fc6bc220b8b745150afb732a40f124
      t.timestamps
    end
  end
end
