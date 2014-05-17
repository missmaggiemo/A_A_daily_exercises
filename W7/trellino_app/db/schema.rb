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

ActiveRecord::Schema.define(version: 20140517000932) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: true do |t|
    t.string   "title",       null: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "boards", ["title"], name: "index_boards_on_title", unique: true, using: :btree

  create_table "cards", force: true do |t|
    t.integer  "list_id",    null: false
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cards", ["list_id"], name: "index_cards_on_list_id", using: :btree

  create_table "lists", force: true do |t|
    t.string   "title",      null: false
    t.integer  "board_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lists", ["board_id"], name: "index_lists_on_board_id", using: :btree
  add_index "lists", ["title", "board_id"], name: "index_lists_on_title_and_board_id", unique: true, using: :btree

end