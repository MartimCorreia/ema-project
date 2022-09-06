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

ActiveRecord::Schema[7.0].define(version: 2022_09_06_184656) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
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
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "conditions", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "injury_locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "injury_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medical_reports", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.string "hospital"
    t.string "diagnosis"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "treatment_id", null: false
    t.index ["patient_id"], name: "index_medical_reports_on_patient_id"
    t.index ["treatment_id"], name: "index_medical_reports_on_treatment_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.float "weight"
    t.bigint "treatment_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "medical_history"
    t.string "occupation"
    t.string "address"
    t.index ["treatment_id"], name: "index_patients_on_treatment_id"
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "procedures", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "treatment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["treatment_id"], name: "index_procedures_on_treatment_id"
    t.index ["user_id"], name: "index_procedures_on_user_id"
  end

  create_table "treatments", force: :cascade do |t|
    t.string "content"
    t.string "age_group"
    t.bigint "injury_location_id", null: false
    t.bigint "injury_type_id", null: false
    t.bigint "condition_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["condition_id"], name: "index_treatments_on_condition_id"
    t.index ["injury_location_id"], name: "index_treatments_on_injury_location_id"
    t.index ["injury_type_id"], name: "index_treatments_on_injury_type_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "medical_reports", "patients"
  add_foreign_key "medical_reports", "treatments"
  add_foreign_key "patients", "treatments"
  add_foreign_key "patients", "users"
  add_foreign_key "procedures", "treatments"
  add_foreign_key "procedures", "users"
  add_foreign_key "treatments", "conditions"
  add_foreign_key "treatments", "injury_locations"
  add_foreign_key "treatments", "injury_types"
end
