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

ActiveRecord::Schema.define(version: 2020_06_05_184548) do

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

  create_table "email_identities", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_email_identities_on_email", unique: true
    t.index ["user_id"], name: "index_email_identities_on_user_id", unique: true
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

  create_table "friendships", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "friend_id", null: false
    t.integer "status", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["friend_id", "user_id"], name: "index_friendships_on_friend_id_and_user_id", unique: true
    t.index ["friend_id"], name: "index_friendships_on_friend_id"
    t.index ["user_id"], name: "index_friendships_on_user_id"
  end

  create_table "partakers", force: :cascade do |t|
    t.bigint "expense_id", null: false
    t.bigint "trip_membership_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["expense_id"], name: "index_partakers_on_expense_id"
    t.index ["trip_membership_id"], name: "index_partakers_on_trip_membership_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "partaker_id", null: false
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "UAH", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["partaker_id"], name: "index_payments_on_partaker_id", unique: true
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "trip_memberships", force: :cascade do |t|
    t.bigint "trip_id", null: false
    t.string "member_type", null: false
    t.bigint "member_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["member_id", "trip_id", "member_type"], name: "index_trip_memberships_on_member_id_and_trip_id_and_member_type", unique: true
    t.index ["member_type", "member_id"], name: "index_trip_memberships_on_member_type_and_member_id"
    t.index ["trip_id"], name: "index_trip_memberships_on_trip_id"
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
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users_roles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "artificial_users", "users", column: "creator_id"
  add_foreign_key "email_identities", "users"
  add_foreign_key "expenses", "trips"
  add_foreign_key "friendships", "users"
  add_foreign_key "friendships", "users", column: "friend_id"
  add_foreign_key "partakers", "expenses"
  add_foreign_key "partakers", "trip_memberships"
  add_foreign_key "payments", "partakers"
  add_foreign_key "trip_memberships", "trips"
  add_foreign_key "trips", "users", column: "creator_id"
  add_foreign_key "users_roles", "roles"
  add_foreign_key "users_roles", "users"
end
