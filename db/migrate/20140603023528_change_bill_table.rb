class ChangeBillTable < ActiveRecord::Migration
  def change
    change_table :bills do |t|
      t.rename :billable_id, :restaurant_id
      t.remove :billable_type
    end
  end
end
