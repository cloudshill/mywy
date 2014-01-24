class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :member, index: true
      t.decimal :total_price
      t.string :address
      t.string :status

      t.timestamps
    end
  end
end
