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

ActiveRecord::Schema.define(version: 2018_04_17_011843) do

  create_table "addresses", force: :cascade do |t|
    t.string "street_name", null: false
    t.integer "street_number", null: false
    t.string "reference"
    t.string "zip_code"
    t.decimal "latitude", precision: 10, scale: 4
    t.decimal "longitude", precision: 10, scale: 4
    t.integer "commune_id"
    t.integer "church_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["church_id"], name: "index_addresses_on_church_id"
    t.index ["commune_id"], name: "index_addresses_on_commune_id"
  end

  create_table "baptisms", force: :cascade do |t|
    t.integer "priest_id"
    t.integer "baptised_id"
    t.integer "mother_id"
    t.integer "father_id"
    t.integer "godfather_id"
    t.integer "godmother_id"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["baptised_id"], name: "index_baptisms_on_baptised_id"
    t.index ["father_id"], name: "index_baptisms_on_father_id"
    t.index ["godfather_id"], name: "index_baptisms_on_godfather_id"
    t.index ["godmother_id"], name: "index_baptisms_on_godmother_id"
    t.index ["mother_id"], name: "index_baptisms_on_mother_id"
    t.index ["priest_id"], name: "index_baptisms_on_priest_id"
  end

  create_table "churches", force: :cascade do |t|
    t.string "name", null: false
    t.string "manager"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "communes", force: :cascade do |t|
    t.integer "province_id"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["province_id"], name: "index_communes_on_province_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "type"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "display_name"
    t.integer "national_identification_number"
    t.string "avatar_url"
    t.datetime "birth_date"
    t.integer "birth_commune_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["birth_commune_id"], name: "index_people_on_birth_commune_id"
  end

  create_table "priests", force: :cascade do |t|
    t.integer "church_id"
    t.string "first_name"
    t.string "last_name"
    t.string "display_name"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["church_id"], name: "index_priests_on_church_id"
  end

  create_table "provinces", force: :cascade do |t|
    t.integer "region_id"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_provinces_on_region_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
