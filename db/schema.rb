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

ActiveRecord::Schema.define(version: 20160128015100) do

  create_table "galleries", force: :cascade do |t|
    t.string   "image_gallery"
    t.text     "description"
    t.integer  "property_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "galleries", ["property_id"], name: "index_galleries_on_property_id"

  create_table "properties", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "status"
    t.decimal  "price"
    t.integer  "beds"
    t.integer  "baths"
    t.string   "spec"
    t.string   "state"
    t.string   "district"
    t.string   "address"
    t.integer  "type_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
    t.integer  "user_id"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "properties", ["type_id"], name: "index_properties_on_type_id"
  add_index "properties", ["user_id"], name: "index_properties_on_user_id"

  create_table "publishers", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "role"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "salt"
  end

  create_table "types", force: :cascade do |t|
    t.string   "property_type"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.string   "name"
    t.string   "role"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "phone"
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
