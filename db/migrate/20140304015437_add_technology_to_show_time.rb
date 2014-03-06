class AddTechnologyToShowTime < ActiveRecord::Migration
  def change
    add_column :show_times, :technology, :string
  end
end
