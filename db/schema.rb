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

ActiveRecord::Schema[7.0].define(version: 2023_09_02_102425) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "btree_gin"
  enable_extension "pg_stat_statements"
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "postgis"
  enable_extension "uuid-ossp"

  create_table "brands", force: :cascade do |t|
    t.text "name", null: false
    t.decimal "rate", default: "0.0", null: false
    t.text "headquarters", null: false
    t.text "industry", null: false
    t.text "founder", null: false
    t.text "website", null: false
    t.text "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "card_attempts", force: :cascade do |t|
    t.text "status", null: false
    t.integer "user_id", null: false
    t.integer "card_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", force: :cascade do |t|
    t.text "name", null: false
    t.decimal "balance", default: "0.0", null: false
    t.text "status", null: false
    t.text "activation_code"
    t.text "pin_code"
    t.integer "user_id", null: false
    t.integer "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.text "name", null: false
    t.decimal "price", default: "0.0", null: false
    t.decimal "currency", default: "0.0", null: false
    t.decimal "weight", default: "0.0", null: false
    t.text "sku", null: false
    t.text "description", null: false
    t.date "manufacturing_date", null: false
    t.string "status", null: false
    t.integer "brand_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spatial_ref_sys", primary_key: "srid", id: :integer, default: nil, force: :cascade do |t|
    t.string "auth_name", limit: 256
    t.integer "auth_srid"
    t.string "srtext", limit: 2048
    t.string "proj4text", limit: 2048
    t.check_constraint "srid > 0 AND srid <= 998999", name: "spatial_ref_sys_srid_check"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.text "auth_credentials"
    t.decimal "payout_rate", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "card_attempts", "cards", name: "card_id_fkey", on_delete: :cascade
  add_foreign_key "card_attempts", "users", name: "user_id_fkey", on_delete: :cascade
  add_foreign_key "cards", "products", name: "product_id_fkey", on_delete: :cascade
  add_foreign_key "cards", "users", name: "user_id_fkey", on_delete: :cascade
  add_foreign_key "products", "brands", name: "brand_id_fkey", on_delete: :cascade
end
