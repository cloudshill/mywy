class AddStatusToEmployment < ActiveRecord::Migration
  def change
    add_column :employments, :status, :string
  end
end
