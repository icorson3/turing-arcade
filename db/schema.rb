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

ActiveRecord::Schema.define(version: 20160802193243) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "citext"

  create_table "games", force: :cascade do |t|
    t.citext   "name"
    t.citext   "github_url"
    t.citext   "heroku_url"
    t.citext   "screenshot_or_gif"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.citext   "slug"
  end

  create_table "users", force: :cascade do |t|
    t.string   "uid"
    t.string   "username"
    t.string   "avatar"
    t.string   "oauth_token"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "role",        default: 0
    t.integer  "game_id"
    t.index ["game_id"], name: "index_users_on_game_id", using: :btree
  end

  add_foreign_key "users", "games"
end
