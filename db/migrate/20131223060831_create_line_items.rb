class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :amount, :default => 1

      t.timestamps
    end
  end
end
