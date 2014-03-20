class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :body
      t.string :eventable_type
      t.integer :eventable_id
      t.integer :member_id
      t.datetime :start
      t.datetime :deadline

      t.timestamps
    end
  end
end
