class CreateJoinTableNatureProduct < ActiveRecord::Migration
  def change
    create_join_table :natures, :products do |t|
      t.index [:nature_id, :product_id]
      t.index [:product_id, :nature_id]
    end
  end
end
