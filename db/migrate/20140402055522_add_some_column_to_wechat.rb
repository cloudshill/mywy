class AddSomeColumnToWechat < ActiveRecord::Migration
  def self.up
    change_table(:wechats) do |t|
      t.string :account_type
      t.string :app_id
      t.string :app_secret
    end
    add_index :wechats, :app_id
    add_index :wechats, :app_secret
  end
end
