class AddWeixinSecretKeyAndWeixinTokenToWechats < ActiveRecord::Migration
  def self.up
    change_table(:wechats) do |t|
      t.string :weixin_secret_key
      t.string :weixin_token
    end
    add_index :wechats, :weixin_secret_key
    add_index :wechats, :weixin_token
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end
