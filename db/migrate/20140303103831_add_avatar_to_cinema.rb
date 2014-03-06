class AddAvatarToCinema < ActiveRecord::Migration
  def change
    add_column :cinemas, :avatar, :string
  end
end
