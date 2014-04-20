class AddShipAddressToMember < ActiveRecord::Migration
  def change
    add_column :members, :ship_address_id, :integer
  end
end
