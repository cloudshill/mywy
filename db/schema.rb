# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140525092416) do

  create_table "addresses", force: true do |t|
    t.string   "addressee"
    t.string   "address"
    t.string   "mobile"
    t.integer  "member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nickname"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "bill_items", force: true do |t|
    t.integer  "amount"
    t.integer  "bill_id"
    t.string   "bill_itemable_type"
    t.integer  "bill_itemable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bills", force: true do |t|
    t.string   "billable_type"
    t.integer  "billable_id"
    t.integer  "table_id"
    t.decimal  "total_price",   precision: 10, scale: 0
    t.boolean  "pay"
    t.decimal  "discount",      precision: 10, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_takeout"
    t.boolean  "checkout"
    t.decimal  "paidin",        precision: 10, scale: 0
    t.string   "sn"
  end

  create_table "carts", force: true do |t|
    t.integer  "member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "carts", ["member_id"], name: "index_carts_on_member_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "sort"
    t.integer  "node_id"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
  end

  add_index "categories", ["node_id"], name: "index_categories_on_node_id", using: :btree

  create_table "categories_products", force: true do |t|
    t.integer "product_id"
    t.integer "category_id"
  end

  create_table "cinemas", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "member_id"
    t.string   "avatar"
    t.text     "guide"
  end

  create_table "comments", force: true do |t|
    t.text     "body"
    t.integer  "member_id"
    t.integer  "commentable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "commentable_type"
  end

  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id", using: :btree
  add_index "comments", ["member_id"], name: "index_comments_on_member_id", using: :btree

  create_table "dinner_tables", force: true do |t|
    t.string   "name"
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "diymenus", force: true do |t|
    t.integer  "wechat_id"
    t.integer  "parent_id"
    t.string   "name"
    t.string   "key"
    t.boolean  "is_show"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sort"
  end

  add_index "diymenus", ["key"], name: "index_diymenus_on_key", using: :btree
  add_index "diymenus", ["parent_id"], name: "index_diymenus_on_parent_id", using: :btree
  add_index "diymenus", ["wechat_id"], name: "index_diymenus_on_wechat_id", using: :btree

  create_table "employments", force: true do |t|
    t.integer  "employmentable_id"
    t.string   "employmentable_type"
    t.integer  "member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

  create_table "events", force: true do |t|
    t.text     "body"
    t.string   "eventable_type"
    t.integer  "eventable_id"
    t.integer  "member_id"
    t.datetime "start"
    t.datetime "deadline"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favorites", force: true do |t|
    t.integer  "member_id"
    t.integer  "favoriteable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "favoriteable_type"
  end

  create_table "foods", force: true do |t|
    t.string   "name"
    t.decimal  "price",         precision: 10, scale: 0
    t.integer  "sales"
    t.string   "description"
    t.integer  "node_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "restaurant_id"
  end

  create_table "hall_seats", force: true do |t|
    t.integer  "movie_hall_id"
    t.integer  "row"
    t.integer  "col"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: true do |t|
    t.string   "image"
    t.string   "imageable_type"
    t.integer  "imageable_id"
    t.boolean  "is_cover"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "member_id"
  end

  create_table "line_items", force: true do |t|
    t.integer  "amount",             default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "member_id"
    t.integer  "order_id"
    t.string   "line_itemable_type"
    t.integer  "line_itemable_id"
  end

  create_table "members", force: true do |t|
    t.string   "email",                  default: ""
    t.string   "encrypted_password",     default: "", null: false
    t.string   "nickname"
    t.string   "mobile"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.string   "business_scope"
    t.string   "avatar"
    t.integer  "ship_address_id"
  end

  add_index "members", ["email"], name: "index_members_on_email", unique: true, using: :btree
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true, using: :btree

  create_table "movie_halls", force: true do |t|
    t.string   "name"
    t.integer  "cinema_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rows"
    t.integer  "cols"
  end

  add_index "movie_halls", ["cinema_id"], name: "index_movie_halls_on_cinema_id", using: :btree

  create_table "movies", force: true do |t|
    t.string   "title"
    t.string   "original_title"
    t.date     "pubdate"
    t.date     "mainland_pubdate"
    t.integer  "year"
    t.string   "durations"
    t.text     "summary"
    t.string   "cover"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "douban_id"
    t.text     "aka"
    t.text     "directors"
    t.text     "casts"
    t.text     "writers"
    t.text     "pubdates"
    t.text     "languages"
    t.text     "genres"
    t.text     "countries"
  end

  create_table "nodes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "business_scope"
  end

  create_table "orders", force: true do |t|
    t.integer  "member_id"
    t.decimal  "total_price", precision: 10, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pay_method"
    t.string   "status"
    t.integer  "address_id"
  end

  add_index "orders", ["member_id"], name: "index_orders_on_member_id", using: :btree

  create_table "pages", force: true do |t|
    t.string   "pageable_type"
    t.integer  "pageable_id"
    t.string   "theme"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", force: true do |t|
    t.string   "image"
    t.boolean  "is_cover"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pictures", ["product_id"], name: "index_pictures_on_product_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "name"
    t.decimal  "price",       precision: 10, scale: 0
    t.decimal  "inprice",     precision: 10, scale: 0
    t.integer  "inventory"
    t.integer  "sales"
    t.string   "barcode"
    t.integer  "node_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  add_index "products", ["node_id"], name: "index_products_on_node_id", using: :btree

  create_table "restaurants", force: true do |t|
    t.string   "name"
    t.string   "avatar"
    t.string   "guide"
    t.integer  "member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "show_times", force: true do |t|
    t.integer  "cinema_id"
    t.integer  "movie_id"
    t.integer  "movie_hall_id"
    t.datetime "show_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price",         precision: 10, scale: 0
    t.string   "technology"
  end

  create_table "tickets", force: true do |t|
    t.integer  "member_id"
    t.integer  "cinema_id"
    t.integer  "movie_id"
    t.integer  "movie_hall_id"
    t.integer  "show_time_id"
    t.integer  "hall_seat_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "channel"
  end

  create_table "trailers", force: true do |t|
    t.string   "url"
    t.integer  "movie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "waps", force: true do |t|
    t.string   "title"
    t.string   "keyword"
    t.string   "match_type"
    t.string   "cover"
    t.string   "logo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "wechat_id"
  end

  create_table "wechat_articles", force: true do |t|
    t.string   "keyword"
    t.string   "match_type"
    t.string   "title"
    t.integer  "sort"
    t.string   "picurl"
    t.text     "description"
    t.string   "link_url"
    t.boolean  "show_cover"
    t.text     "context"
    t.integer  "wechat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wechat_texts", force: true do |t|
    t.string   "keyword"
    t.text     "context"
    t.string   "match_type"
    t.integer  "wechat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wechats", force: true do |t|
    t.string   "wechatable_type"
    t.integer  "wechatable_id"
    t.string   "name"
    t.string   "public_name"
    t.string   "slogan"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "weixin_secret_key"
    t.string   "weixin_token"
    t.string   "account_type"
    t.string   "app_id"
    t.string   "app_secret"
    t.string   "default_focus_method"
    t.string   "default_reply_no_match"
    t.boolean  "default_reply_no_match_flag"
    t.string   "lbs_distance"
    t.string   "focus_reply"
  end

  add_index "wechats", ["app_id"], name: "index_wechats_on_app_id", using: :btree
  add_index "wechats", ["app_secret"], name: "index_wechats_on_app_secret", using: :btree
  add_index "wechats", ["weixin_secret_key"], name: "index_wechats_on_weixin_secret_key", using: :btree
  add_index "wechats", ["weixin_token"], name: "index_wechats_on_weixin_token", using: :btree

end
