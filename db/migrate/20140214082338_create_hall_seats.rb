class CreateHallSeats < ActiveRecord::Migration
  def change
    create_table :hall_seats do |t|
      t.integer :movie_hall_id
      t.integer :row
      t.integer :col

      t.timestamps
    end
  end
end
