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

ActiveRecord::Schema.define(version: 20140502000900) do

  create_table "comments", force: true do |t|
    t.text     "body",              null: false
    t.integer  "link_id",           null: false
    t.integer  "parent_comment_id"
    t.integer  "user_id",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["link_id"], name: "index_comments_on_link_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "links", force: true do |t|
    t.string   "title",      null: false
    t.string   "url",        null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "links", ["user_id"], name: "index_links_on_user_id"

  create_table "sub_memberships", force: true do |t|
    t.integer  "sub_id",     null: false
    t.integer  "link_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sub_memberships", ["link_id", "sub_id"], name: "index_sub_memberships_on_link_id_and_sub_id", unique: true
  add_index "sub_memberships", ["link_id"], name: "index_sub_memberships_on_link_id"
  add_index "sub_memberships", ["sub_id"], name: "index_sub_memberships_on_sub_id"

  create_table "subs", force: true do |t|
    t.string   "name",        null: false
    t.integer  "user_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  add_index "subs", ["name"], name: "index_subs_on_name", unique: true
  add_index "subs", ["user_id"], name: "index_subs_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "session_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["session_token"], name: "index_users_on_session_token"

end
