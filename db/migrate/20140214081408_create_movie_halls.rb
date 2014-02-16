class CreateMovieHalls < ActiveRecord::Migration
  def change
    create_table :movie_halls do |t|
      t.string :name
      t.references :cinema, index: true

      t.timestamps
    end
  end
end
