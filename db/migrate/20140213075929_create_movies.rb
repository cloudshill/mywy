class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :original_title
      t.date :pubdate
      t.date :mainland_pubdate
      t.integer :year
      t.string :durations
      t.text :summary
      t.string :cover
      t.integer :douban_id

      t.timestamps
    end
  end
end
