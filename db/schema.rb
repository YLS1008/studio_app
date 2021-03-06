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

ActiveRecord::Schema.define(version: 2021_05_21_171512) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "activities", force: :cascade do |t|
    t.integer "instructor_id", null: false
    t.string "name"
    t.integer "duration"
    t.integer "capacity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "description"
    t.index ["instructor_id"], name: "index_activities_on_instructor_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "contracts", force: :cascade do |t|
    t.integer "activity_id", null: false
    t.integer "rate_type", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "rate"
    t.index ["activity_id"], name: "index_contracts_on_activity_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "trainee_id", null: false
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trainee_id"], name: "index_conversations_on_trainee_id"
  end

  create_table "enrollments", force: :cascade do |t|
    t.integer "trainee_id"
    t.integer "time_slot_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "registration", default: "ticket"
    t.index ["time_slot_id"], name: "index_enrollments_on_time_slot_id"
    t.index ["trainee_id"], name: "index_enrollments_on_trainee_id"
  end

  create_table "instructors", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first", default: "", null: false
    t.string "last", default: "", null: false
    t.string "phone", default: "", null: false
    t.text "description"
    t.string "speciality"
    t.string "exp"
    t.string "color"
    t.index ["email"], name: "index_instructors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_instructors_on_reset_password_token", unique: true
  end

  create_table "monthly_payments", force: :cascade do |t|
    t.integer "activity_id", null: false
    t.integer "trainee_id", null: false
    t.integer "sum"
    t.integer "month"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_id"], name: "index_monthly_payments_on_activity_id"
    t.index ["trainee_id"], name: "index_monthly_payments_on_trainee_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "user_id"
    t.integer "instructor_id"
    t.integer "admin_id"
    t.boolean "seen"
    t.text "content"
    t.string "level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["admin_id"], name: "index_notifications_on_admin_id"
    t.index ["instructor_id"], name: "index_notifications_on_instructor_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "trainee_id", null: false
    t.integer "sum"
    t.integer "number_of_tickets"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trainee_id"], name: "index_payments_on_trainee_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.integer "trainee_id", null: false
    t.text "content"
    t.datetime "due_date"
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trainee_id"], name: "index_tasks_on_trainee_id"
  end

  create_table "time_slots", force: :cascade do |t|
    t.integer "activity_id", null: false
    t.datetime "start_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "recurring", default: true
    t.string "enrolled", default: ""
    t.integer "occupancy", default: 0
    t.boolean "locked", default: false
    t.index ["activity_id"], name: "index_time_slots_on_activity_id"
  end

  create_table "trainees", force: :cascade do |t|
    t.string "email"
    t.string "first"
    t.string "last"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "ticket", default: 0
    t.date "birthday"
    t.boolean "active", default: true
    t.integer "parent_id", default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first"
    t.string "last"
    t.string "phone"
    t.integer "ticket", default: 0
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "activities", "instructors"
  add_foreign_key "contracts", "activities"
  add_foreign_key "conversations", "trainees"
  add_foreign_key "enrollments", "time_slots"
  add_foreign_key "enrollments", "trainees"
  add_foreign_key "monthly_payments", "activities"
  add_foreign_key "monthly_payments", "trainees"
  add_foreign_key "payments", "trainees"
  add_foreign_key "tasks", "trainees"
  add_foreign_key "time_slots", "activities"
end
