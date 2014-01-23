class ChangeColumnForLineItem < ActiveRecord::Migration
  def change
  	rename_column :line_items, :cart_id, :member_id
  end
end
