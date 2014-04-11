class AddColumnsForLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :line_itemable_type, :string
    add_column :line_items, :line_itemable_id, :integer
    remove_column :line_items, :product_id, :integer
  end
end
