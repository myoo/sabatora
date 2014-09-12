# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140912055637) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "backgrounds", force: true do |t|
    t.integer  "room_id"
    t.string   "image"
    t.string   "name"
    t.text     "about"
    t.integer  "user_id"
    t.integer  "access"
    t.integer  "community_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "backgrounds", ["community_id"], name: "index_backgrounds_on_community_id", using: :btree
  add_index "backgrounds", ["room_id"], name: "index_backgrounds_on_room_id", using: :btree
  add_index "backgrounds", ["user_id"], name: "index_backgrounds_on_user_id", using: :btree

  create_table "character_statuses", force: true do |t|
    t.integer  "illustration_id"
    t.integer  "character_id"
    t.integer  "room_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "character_statuses", ["character_id"], name: "index_character_statuses_on_character_id", using: :btree
  add_index "character_statuses", ["illustration_id"], name: "index_character_statuses_on_illustration_id", using: :btree
  add_index "character_statuses", ["room_id"], name: "index_character_statuses_on_room_id", using: :btree

  create_table "characters", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "about"
    t.integer  "system_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "paramaters"
    t.integer  "retry_number"
    t.text     "profile"
    t.text     "memo"
    t.text     "status"
    t.string   "image"
  end

  add_index "characters", ["user_id"], name: "index_characters_on_user_id", using: :btree

  create_table "characters_illustrations", id: false, force: true do |t|
    t.integer "character_id"
    t.integer "illustration_id"
  end

  create_table "communities", force: true do |t|
    t.string   "name"
    t.text     "about"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "illustrations", force: true do |t|
    t.integer  "user_id"
    t.integer  "access",      default: 2
    t.string   "name",                    null: false
    t.text     "description"
    t.string   "image",                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "illustrations", ["user_id"], name: "index_illustrations_on_user_id", using: :btree

  create_table "joinings", force: true do |t|
    t.integer  "user_id"
    t.integer  "community_id"
    t.integer  "role_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "joinings", ["community_id"], name: "index_joinings_on_community_id", using: :btree
  add_index "joinings", ["role_id"], name: "index_joinings_on_role_id", using: :btree
  add_index "joinings", ["user_id"], name: "index_joinings_on_user_id", using: :btree

  create_table "player_roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: true do |t|
    t.integer  "user_id"
    t.integer  "room_id"
    t.integer  "player_role_id"
    t.integer  "character_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "players", ["character_id"], name: "index_players_on_character_id", using: :btree
  add_index "players", ["player_role_id"], name: "index_players_on_player_role_id", using: :btree
  add_index "players", ["user_id"], name: "index_players_on_user_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rooms", force: true do |t|
    t.string   "name"
    t.string   "about"
    t.integer  "owner_id",                         null: false
    t.integer  "system_id",            default: 0
    t.integer  "community_id",                     null: false
    t.datetime "started_at"
    t.datetime "finished_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "active_background_id"
  end

  add_index "rooms", ["community_id"], name: "index_rooms_on_community_id", using: :btree
  add_index "rooms", ["owner_id"], name: "index_rooms_on_owner_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "channel_key"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "rooms", "communities", name: "rooms_community_id_fk"

end
