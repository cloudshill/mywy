class AddSalesVolumeToStockItem < ActiveRecord::Migration
  def change
    add_column :stock_items, :sales_volume, :integer
  end
end
