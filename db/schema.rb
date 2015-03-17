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

ActiveRecord::Schema.define(version: 20150317192554) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "question_id"
    t.text     "answer"
    t.string   "icon_name"
    t.integer  "custom_order"
    t.integer  "codebook_identifier"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

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

  add_index "decision_points", ["node_id"], name: "index_decision_points_on_node_id", using: :btree
  add_index "decision_points", ["question_type_id"], name: "index_decision_points_on_question_type_id", using: :btree

  create_table "decisions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "decision_point_id"
    t.text     "decision"
    t.integer  "destination_node_id"
    t.integer  "codebook_identifier"
  end

  add_index "decisions", ["decision_point_id"], name: "index_decisions_on_decision_point_id", using: :btree
  add_index "decisions", ["destination_node_id"], name: "index_decisions_on_destination_node_id", using: :btree

  create_table "freeform_responses", force: true do |t|
    t.text     "response_text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "response_id"
  end

  add_index "freeform_responses", ["response_id"], name: "index_freeform_responses_on_response_id", using: :btree

  create_table "nodes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nickname"
    t.boolean  "is_decision_point"
    t.integer  "branch_id"
    t.integer  "decision_id"
    t.integer  "next_node_id"
    t.string   "template_name"
    t.string   "dashboard_type"
    t.boolean  "skippable",         default: true
  end

  add_index "nodes", ["branch_id"], name: "index_nodes_on_branch_id", using: :btree
  add_index "nodes", ["decision_id"], name: "index_nodes_on_decision_id", using: :btree

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

  add_index "questions", ["node_id"], name: "index_questions_on_node_id", using: :btree
  add_index "questions", ["question_type_id"], name: "index_questions_on_question_type_id", using: :btree

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
    t.string   "luggage_type"
    t.integer  "picking_up_number"
    t.string   "traffic_level"
    t.string   "originating_airport_code"
    t.boolean  "experienced_error",        default: false
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

  add_index "responses", ["answer_id"], name: "index_responses_on_answer_id", using: :btree
  add_index "responses", ["decision_id"], name: "index_responses_on_decision_id", using: :btree
  add_index "responses", ["node_id"], name: "index_responses_on_node_id", using: :btree
  add_index "responses", ["respondent_id"], name: "index_responses_on_respondent_id", using: :btree

  create_table "seen_nodes", force: true do |t|
    t.integer  "node_id"
    t.integer  "respondent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
