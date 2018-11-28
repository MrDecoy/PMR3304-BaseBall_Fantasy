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

ActiveRecord::Schema.define(version: 20181128231108) do

  create_table "PlayerHasGames", force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "player_id", null: false
    t.integer "team_id"
    t.integer "score"
    t.integer "homerun"
    t.integer "hits"
    t.integer "at_bats"
    t.integer "rbi"
    t.integer "runs"
    t.integer "error"
    t.index ["game_id", "player_id"], name: "player_has_games_index", unique: true
  end

  create_table "administrators", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cartola_players", force: :cascade do |t|
    t.integer "player_id"
    t.integer "cartola_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cartola_id", "player_id"], name: "index_cartola_players_on_cartola_id_and_player_id", unique: true
  end

  create_table "cartolas", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "player_id"
  end

  create_table "cartolas_players", force: :cascade do |t|
    t.integer "cartola_id", null: false
    t.integer "player_id", null: false
    t.index ["cartola_id", "player_id"], name: "index_cartolas_players_on_cartola_id_and_player_id", unique: true
  end

  create_table "games", force: :cascade do |t|
    t.integer  "home_id"
    t.integer  "visitor_id"
    t.integer  "stadium_id"
    t.integer  "round_id"
    t.integer  "home_score"
    t.integer  "visiting_score"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "Name"
    t.string "Position"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "round_participations", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "round_id"
    t.string   "team_id"
    t.string   "integer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rounds", force: :cascade do |t|
    t.integer  "year"
    t.integer  "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stadia", force: :cascade do |t|
    t.string   "city"
    t.string   "university"
    t.string   "cep"
    t.string   "street"
    t.string   "number"
    t.string   "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "university"
    t.integer  "stadium_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "player_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
