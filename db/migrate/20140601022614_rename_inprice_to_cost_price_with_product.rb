class RenameInpriceToCostPriceWithProduct < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.rename :inprice, :cost_price
    end
  end
end
