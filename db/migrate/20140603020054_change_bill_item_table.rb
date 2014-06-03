class ChangeBillItemTable < ActiveRecord::Migration
  def change
    change_table :bill_items do |t|
      t.rename :bill_itemable_id, :food_id
      t.remove :bill_itemable_type
      t.rename :amount, :quantity
    end
  end
end
