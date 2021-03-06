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

ActiveRecord::Schema.define(version: 20160119062349) do

  create_table "admins", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "merchandises", force: :cascade do |t|
    t.string   "m_name"
    t.float    "m_price"
    t.integer  "m_count"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "merchandises", ["user_id"], name: "index_merchandises_on_user_id"

  create_table "products", force: :cascade do |t|
    t.integer  "shop_id"
    t.decimal  "price"
    t.integer  "quantity"
    t.text     "description"
    t.string   "category"
    t.string   "image_url"
    t.datetime "date_available"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "title",          limit: 40
  end

  create_table "shops", force: :cascade do |t|
    t.string   "name"
    t.string   "tel"
    t.string   "address"
    t.string   "category"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "telephone"
    t.string   "email"
    t.string   "address"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["name"], name: "index_users_on_name", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
