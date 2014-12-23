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

ActiveRecord::Schema.define(version: 20141223193416) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "question_id"
    t.text     "answer"
    t.string   "icon_name"
  end

  create_table "branches", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "decision_points", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "node_id"
    t.string   "nickname"
    t.text     "situation"
    t.integer  "question_type_id"
  end

  create_table "decisions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "decision_point_id"
    t.text     "decision"
    t.integer  "destination_node_id"
  end

  create_table "freeform_responses", force: true do |t|
    t.text     "response_text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "response_id"
  end

  create_table "nodes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nickname"
    t.boolean  "is_decision_point"
    t.integer  "branch_id"
    t.integer  "decision_id"
  end

  create_table "question_types", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "questions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "node_id"
    t.text     "question"
    t.integer  "question_type_id"
  end

  create_table "respondents", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "session_id"
    t.integer  "flight_time_remaining"
    t.integer  "time_elapsed"
    t.integer  "current_node_id"
    t.string   "flight_code"
    t.integer  "passenger_count"
    t.integer  "luggage_count"
    t.string   "original_who_picking_up"
    t.integer  "times_circled"
    t.string   "originating_location"
    t.integer  "landing_time"
    t.boolean  "travel_companion"
    t.string   "final_who_picking_up"
    t.boolean  "active"
  end

  create_table "responses", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "node_id"
    t.integer  "respondent_id"
    t.text     "freeform_answer"
    t.integer  "answer_id"
    t.integer  "decision_id"
    t.integer  "times_seen",       default: 1
    t.integer  "time_remaining"
    t.boolean  "seen"
    t.boolean  "skipped"
    t.integer  "rank"
    t.integer  "user_interaction"
  end

end
