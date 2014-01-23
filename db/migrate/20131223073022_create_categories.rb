class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :sort
      t.references :node, index: true
      t.integer :parent_id

      t.timestamps
    end
  end
end
