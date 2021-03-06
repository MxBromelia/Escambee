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

ActiveRecord::Schema.define(version: 20200528223112) do

  create_table "match_answers", force: :cascade do |t|
    t.integer "match_id"
    t.integer "user_id"
    t.boolean "answer"
    t.index ["match_id"], name: "index_match_answers_on_match_id"
    t.index ["user_id"], name: "index_match_answers_on_user_id"
  end

  create_table "matches", force: :cascade do |t|
    t.integer "proposal_id"
    t.integer "forward_user_id"
    t.integer "backward_user_id"
    t.index ["proposal_id"], name: "index_matches_on_proposal_id"
  end

  create_table "owns", force: :cascade do |t|
    t.string "game_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_owns_on_user_id"
  end

  create_table "proposal_answers", force: :cascade do |t|
    t.integer "proposal_id"
    t.integer "user_id"
    t.integer "direction"
    t.boolean "answer"
    t.index ["proposal_id"], name: "index_proposal_answers_on_proposal_id"
    t.index ["user_id"], name: "index_proposal_answers_on_user_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.string "first_game_id"
    t.string "second_game_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "proposal_id"
    t.index ["proposal_id"], name: "index_transactions_on_proposal_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "phone"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wishes", force: :cascade do |t|
    t.string "game_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_wishes_on_user_id"
  end

end
