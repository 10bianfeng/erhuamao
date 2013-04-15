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

ActiveRecord::Schema.define(:version => 20130415081643) do

  create_table "destination_travels", :force => true do |t|
    t.integer  "destination_id"
    t.integer  "travel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "destinations", :force => true do |t|
    t.string   "name"
    t.string   "desc_title"
    t.text     "desc"
    t.string   "banner_pic"
    t.string   "map_pic"
    t.text     "flights"
    t.string   "timezone"
    t.text     "climate"
    t.text     "health_requirements"
    t.text     "voltage"
    t.text     "currency"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
  end

  add_index "destinations", ["ancestry"], :name => "index_destinations_on_ancestry"

  create_table "interest_travels", :force => true do |t|
    t.integer  "interest_id"
    t.integer  "travel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interests", :force => true do |t|
    t.string   "title"
    t.text     "cont"
    t.string   "ancestry"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "interests", ["ancestry"], :name => "index_interests_on_ancestry"

  create_table "itineraries", :force => true do |t|
    t.string   "name"
    t.text     "desc"
    t.integer  "travel_id"
    t.integer  "sort"
    t.integer  "hotel_id"
    t.string   "meals"
    t.integer  "start_day_num"
    t.integer  "end_day_num"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "travels", :force => true do |t|
    t.string   "name"
    t.string   "sub_name"
    t.string   "series_name"
    t.text     "series_cont"
    t.integer  "priced_from"
    t.integer  "days_count"
    t.integer  "departures"
    t.integer  "max_group_size"
    t.text     "overview_desc"
    t.text     "overview_advantage"
    t.text     "notes"
    t.text     "extensions_ids"
    t.text     "itinerary_pic"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "login"
    t.string   "home_phone"
    t.string   "cellphone"
    t.string   "address"
    t.string   "city"
    t.string   "region"
    t.string   "country"
    t.string   "postal_code"
    t.boolean  "has_past"
    t.string   "title"
    t.datetime "birth_date"
    t.string   "travel_agent"
    t.string   "travel_agent_code"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
