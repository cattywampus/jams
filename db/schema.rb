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

ActiveRecord::Schema.define(version: 20150127070015) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: true do |t|
    t.integer  "person_id"
    t.string   "address_type"
    t.string   "street1"
    t.string   "street2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.boolean  "primary"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "addresses", ["person_id"], name: "index_addresses_on_person_id", using: :btree

  create_table "attendees", force: true do |t|
    t.integer  "person_id"
    t.integer  "dinner_event_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "entree_id"
    t.string   "status"
  end

  add_index "attendees", ["dinner_event_id"], name: "index_attendees_on_dinner_event_id", using: :btree
  add_index "attendees", ["person_id"], name: "index_attendees_on_person_id", using: :btree

  create_table "comments", force: true do |t|
    t.text     "body"
    t.integer  "author_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "dinner_events", force: true do |t|
    t.string   "venue"
    t.string   "room"
    t.string   "street1"
    t.string   "street2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "begins_at"
    t.datetime "ends_at"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "dinner_events", ["event_id"], name: "index_dinner_events_on_event_id", using: :btree

  create_table "entrees", force: true do |t|
    t.integer  "dinner_event_id"
    t.string   "name"
    t.text     "description"
    t.string   "protein"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "entrees", ["dinner_event_id"], name: "index_entrees_on_dinner_event_id", using: :btree

  create_table "events", force: true do |t|
    t.integer  "game_id"
    t.string   "name"
    t.string   "venue"
    t.string   "street1"
    t.string   "street2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.date     "begins_on"
    t.date     "ends_on"
    t.string   "logo"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "event_type",       default: 0
    t.integer  "registered_teams", default: 0
    t.integer  "open_capacity",    default: 0
    t.string   "event_info_url"
    t.string   "address"
    t.integer  "first_event_id"
  end

  add_index "events", ["first_event_id"], name: "index_events_on_first_event_id", unique: true, using: :btree
  add_index "events", ["game_id"], name: "index_events_on_game_id", using: :btree

  create_table "games", force: true do |t|
    t.string   "name"
    t.string   "season"
    t.string   "logo"
    t.integer  "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "active"
  end

  add_index "games", ["program_id"], name: "index_games_on_program_id", using: :btree

  create_table "judge_assignments", force: true do |t|
    t.integer  "judge_team_id"
    t.integer  "judge_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "judge_assignments", ["judge_id"], name: "index_judge_assignments_on_judge_id", using: :btree
  add_index "judge_assignments", ["judge_team_id"], name: "index_judge_assignments_on_judge_team_id", using: :btree

  create_table "judge_teams", force: true do |t|
    t.integer  "event_id"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "judge_teams", ["event_id"], name: "index_judge_teams_on_event_id", using: :btree

  create_table "judges", force: true do |t|
    t.integer  "person_id"
    t.integer  "event_id"
    t.string   "status"
    t.string   "role"
    t.text     "biography"
    t.boolean  "rookie"
    t.boolean  "needs_shirt"
    t.boolean  "completed_vims"
    t.boolean  "provided_consent"
    t.boolean  "provided_conflict"
    t.boolean  "received_event_info"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.boolean  "attending_dinner"
    t.boolean  "biography_approved"
  end

  add_index "judges", ["event_id"], name: "index_judges_on_event_id", using: :btree
  add_index "judges", ["person_id"], name: "index_judges_on_person_id", using: :btree

  create_table "people", force: true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "company"
    t.string   "position"
    t.string   "gender"
    t.string   "shirt_size"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "assistant_id"
    t.string   "suffix"
    t.string   "title"
    t.string   "avatar"
  end

  create_table "phone_numbers", force: true do |t|
    t.integer  "person_id"
    t.string   "phone_type"
    t.string   "phone_number"
    t.boolean  "primary"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "phone_numbers", ["person_id"], name: "index_phone_numbers_on_person_id", using: :btree

  create_table "programs", force: true do |t|
    t.string   "name"
    t.string   "abbr"
    t.string   "logo"
    t.string   "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "user_events", force: true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_events", ["event_id"], name: "index_user_events_on_event_id", using: :btree
  add_index "user_events", ["user_id"], name: "index_user_events_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "invitation_token"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.string   "provider"
    t.string   "uid"
    t.datetime "invitation_created_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "versions", force: true do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.string   "ip"
    t.string   "whodunnit_name"
    t.string   "controller"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
