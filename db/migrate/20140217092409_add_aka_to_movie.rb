class AddAkaToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :aka, :text
    add_column :movies, :directors, :text
    add_column :movies, :casts, :text
    add_column :movies, :writers, :text
    add_column :movies, :pubdates, :text
    add_column :movies, :languages, :text
    add_column :movies, :genres, :text
    add_column :movies, :countries, :text
  end
end
