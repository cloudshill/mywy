class AddPaidinToBill < ActiveRecord::Migration
  def change
    add_column :bills, :paidin, :decimal
  end
end
