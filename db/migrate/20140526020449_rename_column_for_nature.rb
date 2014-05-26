class RenameColumnForNature < ActiveRecord::Migration
  def change
    rename_column :natures, :node_id, :product_id
  end
end
