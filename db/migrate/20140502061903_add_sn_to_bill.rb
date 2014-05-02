class AddSnToBill < ActiveRecord::Migration
  def change
    add_column :bills, :sn, :string
  end
end
