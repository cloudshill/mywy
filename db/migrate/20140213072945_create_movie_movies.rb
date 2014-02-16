class CreateMovieMovies < ActiveRecord::Migration
  def change
    create_table :movie_movies do |t|
      t.string :title
      t.string :original_title
      t.date :pubdate
      t.date :mainland_pubdate
      t.integer :year
      t.string :durations
      t.string :summary
      t.string :cover

      t.timestamps
    end
  end
end
