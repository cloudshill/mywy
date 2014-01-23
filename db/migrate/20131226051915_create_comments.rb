class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :member, index: true
      t.references :product, index: true

      t.timestamps
    end
  end
end
