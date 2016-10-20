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

ActiveRecord::Schema.define(version: 20161019203543) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "contact_detail_id"
    t.text     "address_line",      default: "",    null: false
    t.boolean  "primary_address",   default: false, null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["contact_detail_id"], name: "index_addresses_on_contact_detail_id"
  end

  create_table "contact_details", force: :cascade do |t|
    t.string   "name",       limit: 120, default: "", null: false
    t.string   "email",                  default: ""
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "phone_numbers", force: :cascade do |t|
    t.integer  "contact_detail_id"
    t.string   "mobile_number",     limit: 13, default: "",    null: false
    t.boolean  "primary_number",               default: false, null: false
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.index ["contact_detail_id"], name: "index_phone_numbers_on_contact_detail_id"
  end

end
