class ChangeSomeColumnForLineItem < ActiveRecord::Migration
  def change
    change_table :line_items do |t|
      t.rename :line_itemable_id, :product_id
      t.remove :line_itemable_type
      t.rename :amount, :quantity
    end
  end
end
