# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2024_11_20_152135) do
  create_table "p5_histories", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "points"
    t.string "given_by_id"
    t.string "given_to_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_p5_histories_on_user_id"
  end

  create_table "reward_histories", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "points"
    t.string "given_by_id"
    t.string "given_to_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reward_histories_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "p5_balance"
    t.integer "reward_balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "p5_histories", "users"
  add_foreign_key "reward_histories", "users"
end
