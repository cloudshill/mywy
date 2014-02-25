class AddMemberIdToCinema < ActiveRecord::Migration
  def change
    add_column :cinemas, :member_id, :integer
  end
end
