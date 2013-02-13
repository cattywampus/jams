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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130213193630) do

  create_table "addresses", :force => true do |t|
    t.integer  "person_id"
    t.string   "address_type"
    t.string   "street1"
    t.string   "street2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.boolean  "primary"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "addresses", ["person_id"], :name => "index_addresses_on_person_id"

  create_table "attendees", :force => true do |t|
    t.integer  "person_id"
    t.integer  "dinner_event_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "attendees", ["dinner_event_id"], :name => "index_attendees_on_dinner_event_id"
  add_index "attendees", ["person_id"], :name => "index_attendees_on_person_id"

  create_table "dinner_events", :force => true do |t|
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
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "dinner_events", ["event_id"], :name => "index_dinner_events_on_event_id"

  create_table "events", :force => true do |t|
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
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "events", ["game_id"], :name => "index_events_on_game_id"

  create_table "games", :force => true do |t|
    t.string   "name"
    t.string   "season"
    t.string   "logo"
    t.integer  "program_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "active"
  end

  add_index "games", ["program_id"], :name => "index_games_on_program_id"

  create_table "judges", :force => true do |t|
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
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.boolean  "attending_dinner"
  end

  add_index "judges", ["event_id"], :name => "index_judges_on_event_id"
  add_index "judges", ["person_id"], :name => "index_judges_on_person_id"

  create_table "people", :force => true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "company"
    t.string   "title"
    t.string   "gender"
    t.string   "shirt_size"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "assistant_id"
  end

  create_table "phone_numbers", :force => true do |t|
    t.integer  "person_id"
    t.string   "phone_type"
    t.string   "phone_number"
    t.boolean  "primary"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "phone_numbers", ["person_id"], :name => "index_phone_numbers_on_person_id"

  create_table "programs", :force => true do |t|
    t.string   "name"
    t.string   "abbr"
    t.string   "logo"
    t.string   "icon"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "users", :force => true do |t|
    t.string   "email",                                :default => "", :null => false
    t.string   "encrypted_password",                   :default => ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "invitation_token",       :limit => 60
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["invitation_token"], :name => "index_users_on_invitation_token"
  add_index "users", ["invited_by_id"], :name => "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
