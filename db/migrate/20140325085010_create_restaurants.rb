class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :avatar
      t.string :guide
      t.integer :member_id

      t.timestamps
    end
  end
end
