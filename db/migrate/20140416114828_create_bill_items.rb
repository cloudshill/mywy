class CreateBillItems < ActiveRecord::Migration
  def change
    create_table :bill_items do |t|
      t.integer :amount
      t.integer :bill_id
      t.string :bill_itemable_type
      t.integer :bill_itemable_id

      t.timestamps
    end
  end
end
