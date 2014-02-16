class CreateShowTimes < ActiveRecord::Migration
  def change
    create_table :show_times do |t|
      t.integer :cinema_id
      t.integer :movie_id
      t.integer :movie_hall_id
      t.datetime :show_time

      t.timestamps
    end
  end
end
