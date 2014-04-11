class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :amount, :default => 1
      t.integer :product_id
      t.integer :member_id
      t.integer :order_id
      t.string  :line_itemable_type
      t.integer :line_itemable_id

      t.timestamps
    end
  end
end
