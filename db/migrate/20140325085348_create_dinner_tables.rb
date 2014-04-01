class CreateDinnerTables < ActiveRecord::Migration
  def change
    create_table :dinner_tables do |t|
      t.string :name
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
