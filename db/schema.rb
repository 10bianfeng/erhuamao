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

ActiveRecord::Schema.define(:version => 20130910085709) do

  create_table "banners", :force => true do |t|
    t.string   "name"
    t.string   "cover"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "imgname"
  end

  create_table "bookings", :force => true do |t|
    t.string   "mrs_title"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "preferred_contact_method"
    t.string   "email"
    t.string   "phone"
    t.string   "country"
    t.string   "region"
    t.string   "postal_code"
    t.boolean  "is_subscribe"
    t.integer  "user_id"
    t.integer  "travel_id"
    t.integer  "datesprice_id"
    t.integer  "destination_id"
    t.integer  "people_count"
    t.string   "agent_name"
    t.string   "agent_code"
    t.text     "comment"
    t.boolean  "has_target"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address"
    t.string   "city"
  end

  create_table "brochure_destinations", :force => true do |t|
    t.integer  "brochure_id"
    t.integer  "destination_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brochure_interests", :force => true do |t|
    t.integer  "brochure_id"
    t.integer  "interest_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brochure_travels", :force => true do |t|
    t.integer  "brochure_id"
    t.integer  "travel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brochures", :force => true do |t|
    t.string   "name"
    t.text     "desc"
    t.string   "cover"
    t.string   "doc"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.integer  "destination_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "gallery_id"
  end

  create_table "customizebookings", :force => true do |t|
    t.integer  "number"
    t.integer  "destination_id"
    t.integer  "city_id"
    t.integer  "hotel_id"
    t.integer  "days"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "gbooking_id"
  end

  create_table "datesprices", :force => true do |t|
    t.integer  "travel_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "prices"
    t.integer  "single_supplement"
    t.integer  "internal_airfare"
    t.integer  "availability_status"
    t.integer  "available_people_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.integer  "gallery_id"
    t.string   "flashmap"
  end

  add_index "destinations", ["ancestry"], :name => "index_destinations_on_ancestry"

  create_table "dianpins", :force => true do |t|
    t.string   "name"
    t.text     "cont"
    t.string   "travel_code"
    t.integer  "travel_id"
    t.integer  "user_id"
    t.boolean  "is_show"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "editorimgs", :force => true do |t|
    t.string   "name"
    t.string   "photo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.text     "cont"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "galleries", :force => true do |t|
    t.string   "title"
    t.integer  "travel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gbookingdays", :force => true do |t|
    t.integer  "destination_id"
    t.integer  "city_id"
    t.integer  "hotel_id"
    t.integer  "days"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gbookings", :force => true do |t|
    t.string   "mrs_title"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "preferred_contact_method"
    t.string   "email"
    t.string   "phone"
    t.string   "country"
    t.string   "region"
    t.string   "postal_code"
    t.boolean  "is_subscribe"
    t.integer  "user_id"
    t.string   "agent_name"
    t.string   "agent_code"
    t.integer  "destination_id"
    t.datetime "departure_date"
    t.integer  "trip_day_length"
    t.integer  "adult_count"
    t.integer  "child_count"
    t.text     "event_comment"
    t.text     "city_comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address"
    t.string   "city"
  end

  create_table "hotels", :force => true do |t|
    t.string   "name"
    t.integer  "destination_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "gallery_id"
    t.integer  "city_id"
  end

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
    t.string   "cover"
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

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.text     "cont"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "page_type",  :default => 0
  end

  create_table "photocontests", :force => true do |t|
    t.string   "username"
    t.string   "name"
    t.string   "desc"
    t.string   "photo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.integer  "sort"
    t.string   "pic"
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "gallery_id"
  end

  create_table "presses", :force => true do |t|
    t.string   "title"
    t.text     "cont"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", :force => true do |t|
    t.string   "mrs_title"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "preferred_contact_method"
    t.string   "email"
    t.string   "phone"
    t.string   "country"
    t.text     "question"
    t.integer  "travel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "shouyes", :force => true do |t|
    t.string   "logo"
    t.string   "title"
    t.string   "phone"
    t.text     "lianxi"
    t.string   "block_1_tit"
    t.text     "block_1_cont"
    t.string   "block_2_pic_1"
    t.string   "block_2_pic_2"
    t.string   "block_2_tit"
    t.text     "block_2_cont"
    t.string   "block_2_link"
    t.string   "block_3_tit"
    t.string   "block_3_cont"
    t.string   "block_3_pic"
    t.string   "block_3_link"
    t.string   "block_4_tit"
    t.string   "block_4_1_pic"
    t.string   "block_4_1_tit"
    t.text     "block_4_1_cont"
    t.string   "block_4_1_link"
    t.string   "block_4_2_pic"
    t.string   "block_4_2_tit"
    t.text     "block_4_2_cont"
    t.string   "block_4_2_link"
    t.string   "block_4_3_pic"
    t.string   "block_4_3_tit"
    t.text     "block_4_3_cont"
    t.string   "block_4_3_link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "specialoffer_travels", :force => true do |t|
    t.integer  "specialoffer_id"
    t.integer  "travel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "datesprice_id"
  end

  create_table "specialoffers", :force => true do |t|
    t.string   "title"
    t.text     "desc"
    t.text     "cont"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cover"
  end

  create_table "travels", :force => true do |t|
    t.string   "name"
    t.string   "sub_name"
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
    t.string   "cover"
    t.text     "itinerary_bigpic"
    t.text     "desc_mappic"
    t.integer  "gallery_id"
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
    t.string   "provider"
    t.integer  "uid"
    t.string   "profile_url"
    t.string   "profile_image_url"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
