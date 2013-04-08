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

ActiveRecord::Schema.define(:version => 20130408074655) do

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

end
