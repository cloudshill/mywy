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

ActiveRecord::Schema.define(version: 20140301114937) do

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

  create_table "favorites", force: true do |t|
    t.integer  "member_id"
    t.integer  "favoriteable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "favoriteable_type"
  end

  create_table "hall_seats", force: true do |t|
    t.integer  "movie_hall_id"
    t.integer  "row"
    t.integer  "col"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_items", force: true do |t|
    t.integer  "amount",     default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "product_id"
    t.integer  "member_id"
    t.integer  "order_id"
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
  end

  add_index "members", ["email"], name: "index_members_on_email", unique: true, using: :btree
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true, using: :btree

  create_table "movie_halls", force: true do |t|
    t.string   "name"
    t.integer  "cinema_id"
    t.datetime "created_at"
    t.datetime "updated_at"
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
  end

  create_table "orders", force: true do |t|
    t.integer  "member_id"
    t.decimal  "total_price", precision: 10, scale: 0
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pay_method"
    t.string   "status"
  end

  add_index "orders", ["member_id"], name: "index_orders_on_member_id", using: :btree

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

  create_table "show_times", force: true do |t|
    t.integer  "cinema_id"
    t.integer  "movie_id"
    t.integer  "movie_hall_id"
    t.datetime "show_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price",         precision: 10, scale: 0
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

end
