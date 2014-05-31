class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.string :sku,               :default => '',   :null => false
      t.decimal :price,            :precision => 8,  :scale => 2,  :null => false
      t.datetime :deleted_at
      t.boolean :is_master,        :default => false
      t.integer :product_id
      t.integer :count_on_hand,    :default => 0,    :null => false
      t.decimal :cost_price,       :precision => 8,  :scale => 2
      t.integer :position

      t.timestamps
    end
    add_index :variants, :product_id, :name => 'index_variants_on_product_id'
  end
end
