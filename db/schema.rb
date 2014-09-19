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

ActiveRecord::Schema.define(version: 20140919151231) do

  create_table "dwellings", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "admin_id"
    t.string   "secret_key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "expenses", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.float    "amount"
    t.integer  "payer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_expenses", force: true do |t|
    t.integer  "expense_id"
    t.integer  "user_id"
    t.float    "portion"
    t.float    "paid",       default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_expenses", ["expense_id"], name: "index_user_expenses_on_expense_id"
  add_index "user_expenses", ["user_id"], name: "index_user_expenses_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "password_digest"
    t.integer  "dwelling_id"
    t.string   "remember_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["dwelling_id"], name: "index_users_on_dwelling_id"

end
