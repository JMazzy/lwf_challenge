class CreateShippingAddresses < ActiveRecord::Migration
  def change
    create_table :shipping_addresses do |t|
      t.integer :customer_id, null: false
      t.integer :address_id, null: false

      t.timestamps null: false
    end
  end
end
