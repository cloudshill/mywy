class AddSalesVolumeToVariant < ActiveRecord::Migration
  def change
    add_column :variants, :sales_volume, :integer
  end
end
