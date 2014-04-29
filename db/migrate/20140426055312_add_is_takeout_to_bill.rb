class AddIsTakeoutToBill < ActiveRecord::Migration
  def change
    add_column :bills, :is_takeout, :boolean
  end
end
