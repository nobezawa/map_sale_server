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

ActiveRecord::Schema.define(version: 20140122064220) do

  create_table "companies", force: true do |t|
    t.string   "name"
    t.integer  "prefecture"
    t.string   "address1"
    t.string   "address2"
    t.string   "tel"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "districts", force: true do |t|
    t.integer  "prefecture"
    t.string   "district_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "districts", ["district_name"], name: "index_districts_on_district_name", using: :btree
  add_index "districts", ["prefecture"], name: "index_districts_on_prefecture", using: :btree

  create_table "events", force: true do |t|
    t.integer  "shop_id"
    t.string   "title"
    t.text     "summary"
    t.string   "discount_code"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["shop_id"], name: "index_events_on_shop_id", using: :btree

  create_table "shop_categories", force: true do |t|
    t.string   "type_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shop_detail_types", force: true do |t|
    t.integer  "shop_category_id"
    t.string   "detail_tag_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shops", force: true do |t|
    t.integer  "company_id"
    t.integer  "shop_category_id"
    t.integer  "shop_detail_type_id"
    t.string   "name"
    t.integer  "prefecture"
    t.integer  "district_id"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shops", ["company_id"], name: "index_shops_on_company_id", using: :btree
  add_index "shops", ["district_id"], name: "index_shops_on_district_id", using: :btree
  add_index "shops", ["shop_category_id"], name: "index_shops_on_shop_category_id", using: :btree
  add_index "shops", ["shop_detail_type_id"], name: "index_shops_on_shop_detail_type_id", using: :btree

end
