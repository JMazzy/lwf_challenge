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

ActiveRecord::Schema.define(version: 20160629144152) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "address",    null: false
    t.string   "city",       null: false
    t.string   "state",      null: false
    t.string   "zip",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "addresses", ["address", "city", "state", "zip"], name: "index_addresses_on_address_and_city_and_state_and_zip", unique: true, using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "first_name", null: false
    t.string   "last_name",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "customers", ["first_name", "last_name"], name: "index_customers_on_first_name_and_last_name", using: :btree

  create_table "shipping_addresses", force: :cascade do |t|
    t.integer  "customer_id", null: false
    t.integer  "address_id",  null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
