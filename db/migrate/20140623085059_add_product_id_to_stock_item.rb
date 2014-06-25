class AddProductIdToStockItem < ActiveRecord::Migration
  def change
    add_column :stock_items, :product_id, :integer
  end
end
