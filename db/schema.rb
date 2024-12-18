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

ActiveRecord::Schema[8.0].define(version: 2024_10_25_180006) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "cooked_meal_ingredients", force: :cascade do |t|
    t.bigint "cooked_meal_id", null: false
    t.string "product", null: false
    t.integer "quantity", null: false
    t.integer "calories", null: false
    t.string "unit", null: false
    t.integer "units_per_kcal", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cooked_meal_id"], name: "index_cooked_meal_ingredients_on_cooked_meal_id"
  end

  create_table "cooked_meals", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "recipe_id", null: false
    t.date "cooked_on", null: false
    t.integer "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_cooked_meals_on_recipe_id"
    t.index ["user_id"], name: "index_cooked_meals_on_user_id"
  end

  create_table "entries", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "date", null: false
    t.decimal "weight", precision: 5, scale: 2
    t.boolean "complete", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "date"], name: "index_entries_on_user_id_and_date", unique: true
    t.index ["user_id"], name: "index_entries_on_user_id"
  end

  create_table "entry_meals", force: :cascade do |t|
    t.bigint "entry_id", null: false
    t.string "name", null: false
    t.integer "calories", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entry_id"], name: "index_entry_meals_on_entry_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_ingredients_on_product_id"
    t.index ["recipe_id"], name: "index_ingredients_on_recipe_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.integer "calories", null: false
    t.string "unit", null: false
    t.integer "units_per_kcal", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "source_url"
    t.text "instructions", null: false
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "cooked_meal_ingredients", "cooked_meals"
  add_foreign_key "cooked_meals", "recipes"
  add_foreign_key "cooked_meals", "users"
  add_foreign_key "entries", "users"
  add_foreign_key "entry_meals", "entries"
  add_foreign_key "ingredients", "products"
  add_foreign_key "ingredients", "recipes"
  add_foreign_key "products", "users"
  add_foreign_key "recipes", "users"
  add_foreign_key "sessions", "users"
end
