class AddGuideToCinema < ActiveRecord::Migration
  def change
    add_column :cinemas, :guide, :text
  end
end
