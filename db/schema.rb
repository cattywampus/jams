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

ActiveRecord::Schema.define(version: 20161019052358) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer  "person_id"
    t.string   "address_type", limit: 255
    t.string   "street1",      limit: 255
    t.string   "street2",      limit: 255
    t.string   "city",         limit: 255
    t.string   "state",        limit: 255
    t.string   "zip",          limit: 255
    t.boolean  "primary"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["person_id"], name: "index_addresses_on_person_id", using: :btree
  end

  create_table "attendees", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "dinner_event_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "entree_id"
    t.string   "status",          limit: 255
    t.index ["dinner_event_id"], name: "index_attendees_on_dinner_event_id", using: :btree
    t.index ["person_id"], name: "index_attendees_on_person_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "author_id"
    t.integer  "commentable_id"
    t.string   "commentable_type", limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "dinner_events", force: :cascade do |t|
    t.string   "venue",      limit: 255
    t.string   "room",       limit: 255
    t.string   "street1",    limit: 255
    t.string   "street2",    limit: 255
    t.string   "city",       limit: 255
    t.string   "state",      limit: 255
    t.string   "zip",        limit: 255
    t.datetime "begins_at"
    t.datetime "ends_at"
    t.integer  "event_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["event_id"], name: "index_dinner_events_on_event_id", using: :btree
  end

  create_table "entrees", force: :cascade do |t|
    t.integer  "dinner_event_id"
    t.string   "name",            limit: 255
    t.text     "description"
    t.string   "protein",         limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["dinner_event_id"], name: "index_entrees_on_dinner_event_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.integer  "game_id"
    t.string   "name",             limit: 255
    t.string   "venue",            limit: 255
    t.string   "street1",          limit: 255
    t.string   "street2",          limit: 255
    t.string   "city",             limit: 255
    t.string   "state",            limit: 255
    t.string   "zip",              limit: 255
    t.date     "begins_on"
    t.date     "ends_on"
    t.string   "logo",             limit: 255
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "event_type",                   default: 0
    t.integer  "registered_teams",             default: 0
    t.integer  "open_capacity",                default: 0
    t.string   "event_info_url",   limit: 255
    t.string   "address",          limit: 255
    t.integer  "first_event_id"
    t.integer  "tournament_id"
    t.index ["first_event_id"], name: "index_events_on_first_event_id", unique: true, using: :btree
    t.index ["game_id"], name: "index_events_on_game_id", using: :btree
  end

  create_table "games", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "season",     limit: 255
    t.string   "logo",       limit: 255
    t.integer  "program_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.boolean  "active"
    t.index ["program_id"], name: "index_games_on_program_id", using: :btree
  end

  create_table "judge_assignments", force: :cascade do |t|
    t.integer  "judge_team_id"
    t.integer  "judge_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["judge_id"], name: "index_judge_assignments_on_judge_id", using: :btree
    t.index ["judge_team_id"], name: "index_judge_assignments_on_judge_team_id", using: :btree
  end

  create_table "judge_teams", force: :cascade do |t|
    t.integer  "event_id"
    t.string   "type",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["event_id"], name: "index_judge_teams_on_event_id", using: :btree
  end

  create_table "judges", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "event_id"
    t.string   "status",              limit: 255
    t.string   "role",                limit: 255
    t.text     "biography"
    t.boolean  "rookie"
    t.boolean  "needs_shirt"
    t.boolean  "completed_vims"
    t.boolean  "provided_consent"
    t.boolean  "provided_conflict"
    t.boolean  "received_event_info"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "biography_approved"
    t.index ["event_id"], name: "index_judges_on_event_id", using: :btree
    t.index ["person_id"], name: "index_judges_on_person_id", using: :btree
  end

  create_table "people", force: :cascade do |t|
    t.string   "first_name",   limit: 255
    t.string   "middle_name",  limit: 255
    t.string   "last_name",    limit: 255
    t.string   "email",        limit: 255
    t.string   "company",      limit: 255
    t.string   "position",     limit: 255
    t.string   "gender",       limit: 255
    t.string   "shirt_size",   limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "assistant_id"
    t.string   "suffix",       limit: 255
    t.string   "title",        limit: 255
    t.string   "avatar",       limit: 255
  end

  create_table "phone_numbers", force: :cascade do |t|
    t.integer  "person_id"
    t.string   "phone_type",   limit: 255
    t.string   "phone_number", limit: 255
    t.boolean  "primary"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["person_id"], name: "index_phone_numbers_on_person_id", using: :btree
  end

  create_table "programs", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "abbr",       limit: 255
    t.string   "logo",       limit: 255
    t.string   "icon",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "resource_id"
    t.string   "resource_type", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
    t.index ["name"], name: "index_roles_on_name", using: :btree
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tournaments", force: :cascade do |t|
    t.string   "name"
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_tournaments_on_game_id", using: :btree
  end

  create_table "user_events", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["event_id"], name: "index_user_events_on_event_id", using: :btree
    t.index ["user_id"], name: "index_user_events_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: ""
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                   limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.string   "invitation_token",       limit: 255
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type",        limit: 255
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.datetime "invitation_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["invitation_token"], name: "index_users_on_invitation_token", using: :btree
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",      limit: 255, null: false
    t.integer  "item_id",                    null: false
    t.string   "event",          limit: 255, null: false
    t.string   "whodunnit",      limit: 255
    t.text     "object"
    t.text     "object_changes"
    t.string   "ip",             limit: 255
    t.string   "whodunnit_name", limit: 255
    t.string   "controller",     limit: 255
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
  end

  add_foreign_key "events", "tournaments"
  add_foreign_key "tournaments", "games"
end
