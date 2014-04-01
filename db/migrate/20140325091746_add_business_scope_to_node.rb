class AddBusinessScopeToNode < ActiveRecord::Migration
  def change
    add_column :nodes, :business_scope, :string
  end
end
