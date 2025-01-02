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

ActiveRecord::Schema[7.1].define(version: 2024_11_28_031251) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "documents", primary_key: "document_id", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", limit: 250, null: false
  end

  create_table "employees", primary_key: "employee_id", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", limit: 250, null: false
    t.string "curp", limit: 120, null: false
    t.string "rfc", limit: 100, null: false
    t.date "institutional_date", null: false
    t.string "position", limit: 250, null: false
    t.string "resp_unity", limit: 250, null: false
    t.string "adscription_unity", limit: 250, null: false
    t.uuid "unity_id", null: false
    t.string "budget_key", limit: 150, null: false
    t.string "desc_tmbc", limit: 80, null: false
    t.string "status", limit: 80, null: false
    t.string "account", limit: 100, null: false
    t.string "position_description", limit: 200, null: false
  end

  create_table "files", primary_key: "file_id", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "file_name", limit: 250, null: false
    t.string "cloud_link", limit: 250, null: false
    t.string "status", limit: 100, null: false
    t.uuid "employee_id"
    t.uuid "document_id"
    t.uuid "record_id", null: false
  end

  create_table "missing_documents", primary_key: "missing_document_id", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "document_id"
    t.uuid "employee_id"
  end

  create_table "records", primary_key: "record_id", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "employee_id"
  end

  create_table "unities", primary_key: "unity_id", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", limit: 250, null: false

    t.unique_constraint ["name"], name: "unique_name"
  end

  create_table "users", primary_key: "user_id", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "surname", limit: 100, null: false
    t.string "email", limit: 250, null: false
    t.string "password_digest", limit: 250, null: false
    t.string "role", limit: 80, default: "user"
    t.uuid "unity_id"
  end

  add_foreign_key "employees", "unities", primary_key: "unity_id", name: "employees_unity_id_fkey"
  add_foreign_key "files", "documents", primary_key: "document_id", name: "files_document_id_fkey"
  add_foreign_key "files", "employees", primary_key: "employee_id", name: "files_employee_id_fkey"
  add_foreign_key "files", "records", primary_key: "record_id", name: "files_record_id_fkey"
  add_foreign_key "missing_documents", "documents", primary_key: "document_id", name: "missing_documents_document_id_fkey"
  add_foreign_key "missing_documents", "employees", primary_key: "employee_id", name: "missing_documents_employee_id_fkey"
  add_foreign_key "records", "employees", primary_key: "employee_id", name: "records_employee_id_fkey"
  add_foreign_key "users", "unities", primary_key: "unity_id", name: "users_unity_id_fkey"
end
