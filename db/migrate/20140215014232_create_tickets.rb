class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :member_id
      t.integer :cinema_id
      t.integer :movie_id
      t.integer :movie_hall_id
      t.integer :show_time_id
      t.integer :hall_seat_id
      t.string :status

      t.timestamps
    end
  end
end
