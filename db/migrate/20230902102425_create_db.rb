class CreateDb < ActiveRecord::Migration[7.0]
  def up
    # These are extensions that must be enabled in order to support this database
    enable_extension "btree_gin"
    enable_extension "pg_stat_statements"
    enable_extension "pgcrypto"
    enable_extension "plpgsql"
    enable_extension "postgis"
    enable_extension "uuid-ossp"

    create_table "users", force: :cascade do |t|
      t.string "user_name", null: false
      t.string "email", null: false
      t.string "password_digest", null: false
      t.decimal "payout_rate", default: "0.0"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "brands", force: :cascade do |t|
      t.text "name", null: false
      t.decimal "rate", default: "0.0", null: false
      t.text "headquarters", null: false
      t.text "industry", null: false
      t.text "founder", null: false
      t.text "website", null: false
      t.text "status", null: false

      t.timestamps
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

      t.timestamps
    end

    create_table "cards", force: :cascade do |t|
      t.text "name", null: false
      t.decimal "price", default: "0.0", null: false
      t.text "status", null: false

      t.integer "user_id", null: false
      t.integer "product_id", null: false
      t.timestamps
    end

    add_foreign_key "cards", "users", name: "user_id_fkey", on_delete: :cascade
    add_foreign_key "cards", "products", name: "product_id_fkey", on_delete: :cascade
    add_foreign_key "products", "brands", name: "brand_id_fkey", on_delete: :cascade
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
