class CreateWechatArticles < ActiveRecord::Migration
  def change
    create_table :wechat_articles do |t|
      t.string :keyword
      t.string :match_type
      t.string :title
      t.integer :sort
      t.string :picurl
      t.text :description
      t.string :link_url
      t.boolean :show_cover
      t.text :context
      t.integer :wechat_id

      t.timestamps
    end
  end
end
