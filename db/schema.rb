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

ActiveRecord::Schema.define(version: 20150201052609) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_invitations", force: :cascade do |t|
    t.integer  "accessable_id"
    t.string   "accessable_type"
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.string   "invitation_email"
    t.text     "invitation_body"
    t.string   "token"
    t.datetime "expiration_dts"
    t.datetime "accepted_on_dts"
    t.string   "slug"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "activities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "action"
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "activities", ["trackable_type", "trackable_id"], name: "index_activities_on_trackable_type_and_trackable_id", using: :btree
  add_index "activities", ["user_id"], name: "index_activities_on_user_id", using: :btree

  create_table "batches", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "projected_volume_in_gallons"
    t.decimal  "actual_volume_in_gallons"
    t.decimal  "projected_original_gravity"
    t.decimal  "projected_final_gravity"
    t.decimal  "projected_alcohol_by_volume"
    t.string   "color"
    t.integer  "difficulty"
    t.date     "actual_brew_date"
    t.date     "projected_secondary_transition_date"
    t.date     "projected_bottle_date"
    t.date     "projected_condition_date"
    t.string   "slug"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.decimal  "actual_original_gravity"
    t.decimal  "actual_final_gravity"
    t.decimal  "actual_alcohol_by_volume"
    t.date     "actual_secondary_transition_date"
    t.date     "actual_bottle_date"
    t.date     "actual_condition_date"
    t.integer  "brewery_id"
    t.integer  "actual_international_bittering_units"
    t.integer  "projected_international_bittering_units"
    t.integer  "beer_style_id"
  end

  create_table "beer_styles", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "alternative_names"
    t.string   "examples"
    t.string   "slug"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "breweries", force: :cascade do |t|
    t.string   "name"
    t.string   "slogan"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brewery_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "brewery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "recipe_events", force: :cascade do |t|
    t.string   "action"
    t.string   "subject"
    t.integer  "position"
    t.integer  "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipe_ingredients", force: :cascade do |t|
    t.decimal  "quantity"
    t.integer  "standard_unit"
    t.string   "item"
    t.integer  "ingredient_type"
    t.integer  "recipe_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "color"
    t.integer  "difficulty",                                       default: 1
    t.integer  "recipe_type"
    t.integer  "beer_style_id"
    t.decimal  "projected_volume_in_gallons"
    t.decimal  "projected_original_gravity"
    t.decimal  "projected_final_gravity"
    t.decimal  "projected_alcohol_by_volume"
    t.decimal  "projected_international_bittering_units"
    t.integer  "total_boil_duration_in_minutes"
    t.integer  "primary_fermenting_duration_in_days",              default: 7
    t.integer  "secondary_fermenting_duration_in_days"
    t.integer  "recommended_fermenting_temperature_in_fahrenheit", default: 70
    t.integer  "author_id"
    t.text     "additional_notes"
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
    t.string   "slug"
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "activities", "users"
end
