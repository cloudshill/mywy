class CreateCinemas < ActiveRecord::Migration
  def change
    create_table :cinemas do |t|
      t.string :name
      t.integer :member_id
      t.string :avatar
      t.text :guide

      t.timestamps
    end
  end
end
