class CreateTrailers < ActiveRecord::Migration
  def change
    create_table :trailers do |t|
      t.string :url
      t.integer :movie_id

      t.timestamps
    end
  end
end
