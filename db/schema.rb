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

ActiveRecord::Schema[7.0].define(version: 2023_02_03_171011) do
  create_table "appointments", force: :cascade do |t|
    t.date "date", null: false
    t.time "hour", null: false
    t.string "reason", null: false
    t.string "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.integer "branch_office_id", null: false
    t.integer "personal_id"
    t.integer "state_id", default: 1, null: false
    t.index ["branch_office_id"], name: "index_appointments_on_branch_office_id"
    t.index ["personal_id"], name: "index_appointments_on_personal_id"
    t.index ["state_id"], name: "index_appointments_on_state_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

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
    t.integer "location_id", null: false
    t.index ["location_id"], name: "index_branch_offices_on_location_id"
    t.index ["name"], name: "index_branch_offices_on_name", unique: true
  end

  create_table "locations", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "province_id", null: false
    t.index ["province_id"], name: "index_locations_on_province_id"
  end

  create_table "provinces", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_provinces_on_name", unique: true
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
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

  add_foreign_key "appointments", "branch_offices"
  add_foreign_key "appointments", "states"
  add_foreign_key "appointments", "users"
  add_foreign_key "branch_offices", "locations"
  add_foreign_key "locations", "provinces"
  add_foreign_key "users", "roles"
  add_foreign_key "working_days", "attention_times"
  add_foreign_key "working_days", "branch_offices"
end
