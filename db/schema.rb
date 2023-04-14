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

ActiveRecord::Schema[7.0].define(version: 2023_04_14_111949) do
  create_table "appointments", force: :cascade do |t|
    t.time "start_time"
    t.time "end_time"
    t.integer "doctor_id"
    t.integer "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "doctor_name"
    t.integer "mobile"
    t.string "address"
    t.string "specilization"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time "start_time"
    t.time "end_time"
    t.date "appointment_date"
    t.index ["user_id"], name: "index_doctors_on_user_id"
  end

  create_table "doctors_hospitals", id: false, force: :cascade do |t|
    t.integer "doctor_id", null: false
    t.integer "hospital_id", null: false
  end

  create_table "doctors_patients", id: false, force: :cascade do |t|
    t.integer "patient_id", null: false
    t.integer "doctor_id", null: false
  end

  create_table "hospitals", force: :cascade do |t|
    t.string "hospital_name"
    t.integer "mobile"
    t.string "address"
    t.string "city"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_hospitals_on_user_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "patient_name"
    t.integer "mobile"
    t.string "address"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "records", force: :cascade do |t|
    t.string "patient_disease"
    t.string "suffering_period"
    t.string "height"
    t.string "weight"
    t.integer "patient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_records_on_patient_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "doctors", "users"
  add_foreign_key "hospitals", "users"
  add_foreign_key "patients", "users"
  add_foreign_key "records", "patients"
end
