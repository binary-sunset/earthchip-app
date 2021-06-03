# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_30_160130) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aggregated_stats", force: :cascade do |t|
    t.bigint "device_id", null: false
    t.integer "measurement"
    t.float "value"
    t.string "hour_at"
    t.index ["device_id"], name: "index_aggregated_stats_on_device_id"
  end

  create_table "device_stats", force: :cascade do |t|
    t.bigint "device_id", null: false
    t.float "value"
    t.integer "measurement"
    t.datetime "created_at"
    t.index ["device_id"], name: "index_device_stats_on_device_id"
  end

  create_table "devices", force: :cascade do |t|
    t.string "alias"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["alias"], name: "index_devices_on_alias", unique: true
  end

  add_foreign_key "aggregated_stats", "devices"
  add_foreign_key "device_stats", "devices"
end
