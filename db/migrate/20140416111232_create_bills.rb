class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :billable_type
      t.integer :billable_id
      t.integer :table_id
      t.decimal :total_price
      t.boolean :pay
      t.decimal :discount

      t.timestamps
    end
  end
end
