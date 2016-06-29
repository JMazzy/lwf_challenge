class AddIndicesForAddressAndCustomer < ActiveRecord::Migration
  def change
    add_index :addresses, [:address,:city,:state,:zip], unique: true
    add_index :customers, [:first_name,:last_name]
  end
end
