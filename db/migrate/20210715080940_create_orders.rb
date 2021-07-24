class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :shipping_fee
      t.integer :total_price
      t.integer :payment_method,default: 0
      t.string :name
      t.string :postcode
      t.string :address
      t.integer :order_status, default: 0
      t.timestamps
    end
  end
end