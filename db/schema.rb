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

ActiveRecord::Schema.define(version: 20170911111511) do

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.integer "match_id"
    t.integer "t1_id"
    t.integer "t2_id"
    t.integer "t1_score", default: 0
    t.integer "t2_score", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "winner_team_id"
  end

  create_table "matches", force: :cascade do |t|
    t.string "name"
    t.integer "winner_team"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.decimal "rank", precision: 5, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "winning_count"
  end

  create_table "teams_matches", force: :cascade do |t|
    t.integer "team_id"
    t.integer "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_teams_matches_on_match_id"
    t.index ["team_id"], name: "index_teams_matches_on_team_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users_teams", force: :cascade do |t|
    t.integer "user_id"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_users_teams_on_team_id"
    t.index ["user_id"], name: "index_users_teams_on_user_id"
  end

end
