class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.decimal :price
      t.integer :sales
      t.string :description
      t.integer :node_id

      t.timestamps
    end
  end
end
