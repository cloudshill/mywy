class CreateWechatTexts < ActiveRecord::Migration
  def change
    create_table :wechat_texts do |t|
      t.string :keyword
      t.text :context
      t.string :match_type
      t.integer :wechat_id

      t.timestamps
    end
  end
end
