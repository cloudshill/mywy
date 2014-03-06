class AddBusinessScopeToMember < ActiveRecord::Migration
  def change
    add_column :members, :business_scope, :string
  end
end
