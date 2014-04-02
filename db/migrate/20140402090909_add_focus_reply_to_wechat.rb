class AddFocusReplyToWechat < ActiveRecord::Migration
  def change
    add_column :wechats, :focus_reply, :string
  end
end
