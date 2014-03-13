class CreateMovieHalls < ActiveRecord::Migration
  def change
    create_table :movie_halls do |t|
      t.string :name
      t.references :cinema, index: true
      t.integer :rows
      t.integer :cols

      t.timestamps
    end
  end
end
