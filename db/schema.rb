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

ActiveRecord::Schema.define(version: 2020_04_02_151358) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bets", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "round_id"
    t.bigint "madeup_answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["madeup_answer_id"], name: "index_bets_on_madeup_answer_id"
    t.index ["round_id"], name: "index_bets_on_round_id"
    t.index ["user_id"], name: "index_bets_on_user_id"
  end

  create_table "decks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.bigint "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_games_on_room_id"
  end

  create_table "madeup_answers", force: :cascade do |t|
    t.bigint "user_id"
    t.text "content"
    t.bigint "round_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["round_id"], name: "index_madeup_answers_on_round_id"
    t.index ["user_id"], name: "index_madeup_answers_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "deck_id"
    t.text "content"
    t.text "solution"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deck_id"], name: "index_questions_on_deck_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "rounds", force: :cascade do |t|
    t.bigint "game_id"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_rounds_on_game_id"
    t.index ["question_id"], name: "index_rounds_on_question_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "room_id"
    t.string "username"
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["room_id"], name: "index_users_on_room_id"
  end

  add_foreign_key "bets", "madeup_answers"
  add_foreign_key "bets", "rounds"
  add_foreign_key "bets", "users"
  add_foreign_key "games", "rooms"
  add_foreign_key "madeup_answers", "rounds"
  add_foreign_key "madeup_answers", "users"
  add_foreign_key "questions", "decks"
  add_foreign_key "rounds", "games"
  add_foreign_key "rounds", "questions"
end
