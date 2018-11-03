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

ActiveRecord::Schema.define(version: 2018_11_03_021562) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "token_authenticate_me_invites", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", null: false
    t.boolean "accepted"
    t.jsonb "meta", default: "{}", null: false
    t.integer "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_token_authenticate_me_invites_on_creator_id"
  end

  create_table "token_authenticate_me_sessions", force: :cascade do |t|
    t.string "key", null: false
    t.datetime "expiration"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_token_authenticate_me_sessions_on_key", unique: true
  end

  create_table "token_authenticate_me_users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_token_exp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_token_authenticate_me_users_on_email", unique: true
    t.index ["password_digest"], name: "index_token_authenticate_me_users_on_password_digest", unique: true
    t.index ["reset_password_token"], name: "index_token_authenticate_me_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_token_authenticate_me_users_on_username", unique: true
  end

  add_foreign_key "token_authenticate_me_invites", "token_authenticate_me_users", column: "creator_id"
  add_foreign_key "token_authenticate_me_sessions", "token_authenticate_me_users", column: "user_id"
end