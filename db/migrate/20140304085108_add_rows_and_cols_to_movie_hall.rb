class AddRowsAndColsToMovieHall < ActiveRecord::Migration
  def change
    add_column :movie_halls, :rows, :integer
    add_column :movie_halls, :cols, :integer
  end
end
