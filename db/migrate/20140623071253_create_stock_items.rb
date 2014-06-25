class CreateStockItems < ActiveRecord::Migration
  def change
    create_table :stock_items do |t|
      t.integer :count_on_hand
      t.integer :variant_id

      t.timestamps
    end
  end
end
