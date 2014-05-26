class AddReceivableToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :receivable, :decimal
  end
end
