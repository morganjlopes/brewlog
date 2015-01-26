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

ActiveRecord::Schema.define(version: 20150126104134) do

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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.decimal  "actual_original_gravity"
    t.decimal  "actual_final_gravity"
    t.decimal  "actual_alcohol_by_volume"
    t.date     "actual_secondary_transition_date"
    t.date     "actual_bottle_date"
    t.date     "actual_condition_date"
    t.integer  "brewery_id"
  end

  create_table "breweries", force: :cascade do |t|
    t.string   "name"
    t.string   "slogan"
    t.string   "slug"
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

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

end
