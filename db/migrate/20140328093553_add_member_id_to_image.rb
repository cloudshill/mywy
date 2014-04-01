class AddMemberIdToImage < ActiveRecord::Migration
  def change
    add_column :images, :member_id, :integer
  end
end
