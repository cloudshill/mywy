class AddSomeColumnToWechatTwo < ActiveRecord::Migration
  def self.up
    change_table(:wechats) do |t|
      t.string :default_focus_method
      t.string :default_reply_no_match
      t.boolean :default_reply_no_match_flag
      t.string :lbs_distance
    end
  end
end
