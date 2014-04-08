class AddWechatIdToWap < ActiveRecord::Migration
  def change
    add_column :waps, :wechat_id, :integer
  end
end
