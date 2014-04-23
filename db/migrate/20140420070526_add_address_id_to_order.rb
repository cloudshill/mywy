class AddAddressIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :address_id, :integer
    remove_column :orders, :address
  end
end
