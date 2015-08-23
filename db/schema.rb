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

ActiveRecord::Schema.define(version: 20150701142741) do

  create_table "answermsgs", force: true do |t|
    t.integer  "question_id"
    t.integer  "user_id"
    t.integer  "answer_user"
    t.boolean  "read"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answermsgs", ["user_id", "created_at"], name: "index_answermsgs_on_user_id_and_created_at"

  create_table "answers", force: true do |t|
    t.string   "content"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "answers", ["question_id", "created_at"], name: "index_answers_on_question_id_and_created_at"

  create_table "invites", force: true do |t|
    t.integer  "invite_id"
    t.integer  "invited_id"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "read",        default: false
    t.boolean  "answer_flag"
    t.integer  "answer_user"
  end

  add_index "invites", ["invited_id", "created_at"], name: "index_invites_on_invited_id_and_created_at"

  create_table "qapproves", force: true do |t|
    t.integer  "question_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "qapproves", ["question_id", "created_at"], name: "index_qapproves_on_question_id_and_created_at"

  create_table "questions", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "approve",    default: 0
    t.integer  "disapprove", default: 0
    t.string   "title"
  end

  add_index "questions", ["user_id", "created_at"], name: "index_questions_on_user_id_and_created_at"

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

# Could not dump table "users" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

end
