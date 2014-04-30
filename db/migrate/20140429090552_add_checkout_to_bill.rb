class AddCheckoutToBill < ActiveRecord::Migration
  def change
    add_column :bills, :checkout, :boolean
  end
end
