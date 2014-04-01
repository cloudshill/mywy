class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image
      t.string :imageable_type
      t.integer :imageable_id
      t.boolean :is_cover

      t.timestamps
    end
  end
end
