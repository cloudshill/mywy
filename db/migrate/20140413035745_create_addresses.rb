class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :addressee
      t.string :address
      t.string :mobile
      t.integer :member_id

      t.timestamps
    end
  end
end
