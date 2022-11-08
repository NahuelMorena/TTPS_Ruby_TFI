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

ActiveRecord::Schema[7.0].define(version: 2022_11_08_025228) do
  create_table "attention_times", force: :cascade do |t|
    t.time "hour_start", null: false
    t.time "hour_end", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "branch_offices", force: :cascade do |t|
    t.string "name", null: false
    t.string "direction", null: false
    t.string "phone", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.string "surname", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role_id", default: 3, null: false
    t.integer "branch_office_id"
    t.index ["branch_office_id"], name: "index_users_on_branch_office_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  create_table "working_days", force: :cascade do |t|
    t.string "day", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "branch_office_id", null: false
    t.integer "attention_time_id", null: false
    t.index ["attention_time_id"], name: "index_working_days_on_attention_time_id"
    t.index ["branch_office_id"], name: "index_working_days_on_branch_office_id"
  end

  add_foreign_key "users", "roles"
  add_foreign_key "working_days", "attention_times"
  add_foreign_key "working_days", "branch_offices"
end
