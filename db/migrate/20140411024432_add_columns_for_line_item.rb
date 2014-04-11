class AddColumnsForLineItem < ActiveRecord::Migration
  def change
    remove_column :line_items, :product_id, :integer
  end
end
