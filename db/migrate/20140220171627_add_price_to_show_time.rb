class AddPriceToShowTime < ActiveRecord::Migration
  def change
    add_column :show_times, :price, :decimal
  end
end
