class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.decimal :inprice
      t.integer :inventory
      t.integer :sales
      t.string :barcode
      t.references :node, index: true

      t.timestamps
    end
  end
end
