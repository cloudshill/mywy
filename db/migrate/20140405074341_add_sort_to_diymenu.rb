class AddSortToDiymenu < ActiveRecord::Migration
  def change
    add_column :diymenus, :sort, :integer
  end
end
