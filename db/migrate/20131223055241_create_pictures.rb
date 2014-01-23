class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :image
      t.boolean :is_cover
      t.references :product, index: true

      t.timestamps
    end
  end
end
