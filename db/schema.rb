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

ActiveRecord::Schema.define(version: 20140807185211) do

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "resource_id"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["resource_id"], name: "index_comments_on_resource_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "learning_styles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "learning_styles_resources", force: true do |t|
    t.integer "resources_id"
    t.integer "learning_styles_id"
  end

  add_index "learning_styles_resources", ["resources_id"], name: "index_learning_styles_resources_on_resources_id"

  create_table "resources", force: true do |t|
    t.integer  "creator_id"
    t.string   "title"
    t.string   "link"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "resources", ["creator_id"], name: "index_resources_on_creator_id"

  create_table "subjects", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects_resources", id: false, force: true do |t|
    t.integer  "subject_id"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subjects_resources", ["resource_id"], name: "index_subjects_resources_on_resource_id"
  add_index "subjects_resources", ["subject_id"], name: "index_subjects_resources_on_subject_id"

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "cohort"
    t.string   "email"
    t.string   "username"
    t.string   "role"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", force: true do |t|
    t.integer  "voter_id"
    t.integer  "resource_id"
    t.integer  "learning_style_id"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["resource_id"], name: "index_votes_on_resource_id"
  add_index "votes", ["voter_id"], name: "index_votes_on_voter_id"

end
