class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.integer :shipping_fee, null: false
      t.integer :total_price, null: false
      t.integer :payment_method, null: false
      t.string :name, null: false
      t.string :postcode, null: false
      t.string :address, null: false
      t.integer :order_status
      t.timestamps
    end
  end
end