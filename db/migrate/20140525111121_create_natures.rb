class CreateNatures < ActiveRecord::Migration
  def change
    create_table :natures do |t|
      t.string :name
      t.integer :node_id
      t.integer :parent_id
      t.integer :sort

      t.timestamps
    end
  end
end
