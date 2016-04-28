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

ActiveRecord::Schema.define(version: 20150424203350) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: true do |t|
    t.text     "body",         null: false
    t.integer  "commenter_id", null: false
    t.integer  "project_id",   null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "pledges", force: true do |t|
    t.integer  "pledger_id", null: false
    t.integer  "project_id", null: false
    t.float    "amt",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: true do |t|
    t.integer  "starter_id",                        null: false
    t.string   "title",                             null: false
    t.float    "fund_goal",                         null: false
    t.text     "description",                       null: false
    t.date     "end_date",                          null: false
    t.text     "summary",                           null: false
    t.string   "city",                              null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.float    "pledge_total",        default: 0.0
    t.integer  "category_id"
    t.string   "main_image_url",                    null: false
    t.string   "secondary_image_url"
  end

  create_table "rewards", force: true do |t|
    t.integer  "project_id",   null: false
    t.text     "summary",      null: false
    t.date     "est_delivery", null: false
    t.float    "min_amt",      null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: true do |t|
    t.string   "username",        null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.text     "bio"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
