class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :last_name
      t.string :first_name
      t.string :last_name_kana
      t.string :first_name_kana
      t.string :postcode
      t.string :address
      t.string :phone_number
      t.string :email
      t.string :password
      t.boolean :delete_user
      t.timestamps
    end
  end
end
