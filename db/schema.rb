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

ActiveRecord::Schema.define(version: 2019_10_31_033120) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "listings", force: :cascade do |t|
    t.string "title"
    t.string "name"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.string "curator"
    t.string "exhibit_patron"
    t.text "photo_credit"
    t.bigint "museum_id"
    t.integer "price"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["museum_id"], name: "index_listings_on_museum_id"
  end

  create_table "listings_styles", force: :cascade do |t|
    t.bigint "style_id"
    t.bigint "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_listings_styles_on_listing_id"
    t.index ["style_id"], name: "index_listings_styles_on_style_id"
  end

  create_table "museums", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.time "opening_time"
    t.time "closing_time"
    t.boolean "wheelchair_accessible"
    t.string "street"
    t.string "city"
    t.string "country"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_museums_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "listing_id"
    t.integer "price"
    t.string "stripe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_payments_on_listing_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "styles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "listings", "museums"
  add_foreign_key "listings_styles", "listings"
  add_foreign_key "listings_styles", "styles"
  add_foreign_key "museums", "users"
  add_foreign_key "payments", "listings"
  add_foreign_key "payments", "users"
end
