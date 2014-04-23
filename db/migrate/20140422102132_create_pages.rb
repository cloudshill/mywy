class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :pageable_type
      t.integer :pageable_id
      t.string :theme

      t.timestamps
    end
  end
end
