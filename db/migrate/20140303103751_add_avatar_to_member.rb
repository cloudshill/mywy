class AddAvatarToMember < ActiveRecord::Migration
  def change
    add_column :members, :avatar, :string
  end
end
