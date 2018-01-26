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

ActiveRecord::Schema.define(version: 20180125070322) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "billable_items", force: :cascade do |t|
    t.string "name"
    t.string "item_number"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "business_id"
    t.string "practitioner_full_name"
    t.integer "owner_health_id"
    t.index ["business_id"], name: "index_billable_items_on_business_id"
  end

  create_table "blogs", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "businesses", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "facebook"
    t.string "twitter"
    t.string "linkedin"
  end

  create_table "home_settings", force: :cascade do |t|
    t.string "introduction_title"
    t.text "introduction_description"
    t.string "careers_title"
    t.text "careers_description"
    t.integer "business_id"
    t.string "business_name"
    t.string "business_phone"
    t.string "business_address"
    t.string "business_email"
    t.string "api_key"
    t.datetime "last_sync_practitioners_at"
    t.datetime "last_sync_billable_items_at"
    t.index ["business_id"], name: "index_home_settings_on_business_id"
  end

  create_table "practitioners", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "profession"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer "business_id"
    t.string "full_name"
    t.string "summary"
    t.string "registration"
    t.integer "owner_health_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "business_id"
    t.string "role"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["business_id"], name: "index_users_on_business_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_users_on_invitations_count"
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "users", "businesses"
end
