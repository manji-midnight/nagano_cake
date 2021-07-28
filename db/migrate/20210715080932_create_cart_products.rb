class CreateCartProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_products do |t|
      t.integer :customer_id, null: false
      t.integer :product_id, null: false
      t.integer :quantity, :default => 1, null: false
      t.timestamps
    end
  end
end
