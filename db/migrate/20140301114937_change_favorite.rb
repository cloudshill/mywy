class ChangeFavorite < ActiveRecord::Migration
  def change
    rename_column :favorites, :product_id, :favoriteable_id
    add_column :favorites, :favoriteable_type, :string
  end
end
