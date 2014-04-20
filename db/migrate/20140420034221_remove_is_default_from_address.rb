class RemoveIsDefaultFromAddress < ActiveRecord::Migration
  def change
    remove_column :addresses, :is_default
  end
end
