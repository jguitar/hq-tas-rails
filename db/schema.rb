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

ActiveRecord::Schema.define(version: 2018_04_17_154937) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buildings", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.bigint "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id"], name: "index_buildings_on_site_id"
  end

  create_table "business_units", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contributors", force: :cascade do |t|
    t.string "code"
    t.string "first_name"
    t.string "last_name"
    t.bigint "business_unit_id"
    t.bigint "workplace_id"
    t.bigint "workroom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "site_id"
    t.index ["business_unit_id"], name: "index_contributors_on_business_unit_id"
    t.index ["site_id"], name: "index_contributors_on_site_id"
    t.index ["workplace_id"], name: "index_contributors_on_workplace_id"
    t.index ["workroom_id"], name: "index_contributors_on_workroom_id"
  end

  create_table "floors", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.bigint "building_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_floors_on_building_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workplaces", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.bigint "workroom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["workroom_id"], name: "index_workplaces_on_workroom_id"
  end

  create_table "workrooms", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "floor_id"
    t.index ["floor_id"], name: "index_workrooms_on_floor_id"
  end

end
