class CreateWechats < ActiveRecord::Migration
  def change
    create_table :wechats do |t|
      t.string :wechatable_type
      t.integer :wechatable_id
      t.string :name
      t.string :public_name
      t.string :slogan
      t.text :description

      t.timestamps
    end
  end
end
