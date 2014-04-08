class CreateWaps < ActiveRecord::Migration
  def change
    create_table :waps do |t|
      t.string :title
      t.string :keyword
      t.string :match_type
      t.string :cover
      t.string :logo

      t.timestamps
    end
  end
end
