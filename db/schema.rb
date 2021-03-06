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

ActiveRecord::Schema.define(version: 20131008215211) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "icon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "collection_spots", force: true do |t|
    t.string   "name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "region_state"
    t.string   "postcode"
    t.string   "country"
    t.string   "coords"
    t.string   "directions"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "donor_items", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "awaiting_pickup"
    t.string   "image_url"
    t.integer  "oversized"
    t.datetime "pickup_details"
    t.text     "thanks"
    t.integer  "subcategory_id"
    t.integer  "user_id"
    t.integer  "needed_item_id"
    t.integer  "location_id"
    t.integer  "collection_spot_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "region_state"
    t.string   "postcode"
    t.string   "country"
    t.string   "coords"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations_users", force: true do |t|
    t.integer "location_id"
    t.integer "user_id"
  end

  create_table "mercury_images", force: true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "needed_items", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "still_needed"
    t.string   "image_url"
    t.integer  "oversized"
    t.integer  "subcategory_id"
    t.integer  "need_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "needs", force: true do |t|
    t.string   "title"
    t.text     "story"
    t.string   "image_url"
    t.integer  "complete"
    t.text     "thanks"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.string   "label"
    t.string   "heading"
    t.text     "caption"
    t.string   "subheading_1"
    t.text     "opening_1"
    t.text     "content_1"
    t.string   "subheading_2"
    t.text     "opening_2"
    t.text     "content_2"
    t.string   "subheading_3"
    t.text     "opening_3"
    t.text     "content_3"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: true do |t|
    t.string "image_url"
  end

  create_table "subcategories", force: true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "preferred_email"
    t.string   "image_url"
    t.boolean  "facilitator"
    t.integer  "collection_spot_id"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
