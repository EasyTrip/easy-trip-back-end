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

ActiveRecord::Schema.define(version: 2019_10_10_124215) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "artificial_users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.bigint "creator_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creator_id"], name: "index_artificial_users_on_creator_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.bigint "trip_id", null: false
    t.string "name", null: false
    t.text "description"
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "UAH", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trip_id"], name: "index_expenses_on_trip_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.bigint "trip_id", null: false
    t.string "member_type", null: false
    t.bigint "member_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["member_type", "member_id"], name: "index_memberships_on_member_type_and_member_id"
    t.index ["trip_id"], name: "index_memberships_on_trip_id"
  end

  create_table "partakers", force: :cascade do |t|
    t.bigint "expense_id", null: false
    t.bigint "membership_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["expense_id"], name: "index_partakers_on_expense_id"
    t.index ["membership_id"], name: "index_partakers_on_membership_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "partaker_id", null: false
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "UAH", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["partaker_id"], name: "index_payments_on_partaker_id", unique: true
  end

  create_table "trips", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.bigint "creator_id", null: false
    t.datetime "start_date"
    t.datetime "finish_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creator_id"], name: "index_trips_on_creator_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "password_digest"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "artificial_users", "users", column: "creator_id"
  add_foreign_key "expenses", "trips"
  add_foreign_key "memberships", "trips"
  add_foreign_key "partakers", "expenses"
  add_foreign_key "partakers", "memberships"
  add_foreign_key "payments", "partakers"
  add_foreign_key "trips", "users", column: "creator_id"
end
