class AddAvatarToNode < ActiveRecord::Migration
  def change
    add_column :nodes, :avatar, :string
  end
end
