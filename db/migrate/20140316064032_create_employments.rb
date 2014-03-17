class CreateEmployments < ActiveRecord::Migration
  def change
    create_table :employments do |t|
      t.integer :employmentable_id
      t.string :employmentable_type
      t.integer :member_id

      t.timestamps
    end
  end
end
