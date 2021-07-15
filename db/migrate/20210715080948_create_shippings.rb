class CreateShippings < ActiveRecord::Migration[5.0]
  def change
    create_table :shippings do |t|
      t.integer :customer_id
      t.string :name
      t.string :postcode
      t.string :address
      t.timestamps
    end
  end
end
