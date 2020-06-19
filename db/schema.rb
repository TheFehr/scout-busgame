# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_05_24_184527) do

  create_table "bus_lines", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bus_stops", force: :cascade do |t|
    t.integer "bus_line_id"
    t.integer "position_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bus_line_id"], name: "index_bus_stops_on_bus_line_id"
    t.index ["position_id"], name: "index_bus_stops_on_position_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone", null: false
    t.integer "money", default: 0
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "occupations", force: :cascade do |t|
    t.integer "position_id"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_occupations_on_group_id"
    t.index ["position_id"], name: "index_occupations_on_position_id"
  end

  create_table "permit_buys", force: :cascade do |t|
    t.integer "group_id"
    t.integer "permit_price_id"
    t.boolean "used", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_permit_buys_on_group_id"
    t.index ["permit_price_id"], name: "index_permit_buys_on_permit_price_id"
  end

  create_table "permit_prices", force: :cascade do |t|
    t.integer "price"
    t.integer "permit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permit_id"], name: "index_permit_prices_on_permit_id"
  end

  create_table "permits", force: :cascade do |t|
    t.integer "kind", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kind"], name: "index_permits_on_kind", unique: true
  end

  create_table "positions", force: :cascade do |t|
    t.string "name"
    t.integer "zone_id"
    t.integer "group_id"
    t.integer "points"
    t.boolean "main_position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_positions_on_group_id"
    t.index ["name"], name: "index_positions_on_name", unique: true
    t.index ["zone_id"], name: "index_positions_on_zone_id"
  end

  create_table "zones", force: :cascade do |t|
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_zones_on_group_id"
  end

  add_foreign_key "bus_stops", "bus_lines"
  add_foreign_key "bus_stops", "positions"
  add_foreign_key "occupations", "groups"
  add_foreign_key "occupations", "positions"
  add_foreign_key "permit_buys", "groups"
  add_foreign_key "permit_buys", "permit_prices"
  add_foreign_key "permit_prices", "permits"
  add_foreign_key "positions", "groups"
  add_foreign_key "positions", "zones"
  add_foreign_key "zones", "groups"
end
