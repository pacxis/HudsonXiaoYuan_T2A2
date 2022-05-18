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

ActiveRecord::Schema[7.0].define(version: 2022_05_16_015234) do
  create_table "bookings", force: :cascade do |t|
    t.integer "listing_id", null: false
    t.integer "user_profile_id", null: false
    t.string "address"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_bookings_on_listing_id"
    t.index ["user_profile_id"], name: "index_bookings_on_user_profile_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "listing_categories", force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "listing_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_listing_categories_on_category_id"
    t.index ["listing_id"], name: "index_listing_categories_on_listing_id"
  end

  create_table "listings", force: :cascade do |t|
    t.string "title"
    t.integer "user_profile_id", null: false
    t.integer "price"
    t.text "listing_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_profile_id"], name: "index_listings_on_user_profile_id"
  end

  create_table "menu_items", force: :cascade do |t|
    t.integer "menu_id"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_menu_items_on_menu_id"
  end

  create_table "menus", force: :cascade do |t|
    t.integer "listing_id"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_menus_on_listing_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "listings"
  add_foreign_key "bookings", "user_profiles"
  add_foreign_key "listing_categories", "categories"
  add_foreign_key "listing_categories", "listings"
  add_foreign_key "listings", "user_profiles"
  add_foreign_key "menu_items", "menus"
  add_foreign_key "menus", "listings"
  add_foreign_key "user_profiles", "users"
end
