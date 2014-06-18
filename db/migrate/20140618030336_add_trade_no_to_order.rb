class AddTradeNoToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :trade_no, :string
  end
end
