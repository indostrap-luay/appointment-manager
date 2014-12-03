# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141203001035) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointment_diagnostic_codes", force: true do |t|
    t.integer  "appointment_id"
    t.integer  "diagnostic_code_id"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "appointment_diagnostic_codes", ["appointment_id"], name: "index_appointment_diagnostic_codes_on_appointment_id", using: :btree
  add_index "appointment_diagnostic_codes", ["diagnostic_code_id"], name: "index_appointment_diagnostic_codes_on_diagnostic_code_id", using: :btree

  create_table "appointments", force: true do |t|
    t.string   "patient_name"
    t.string   "patient_code"
    t.date     "birthdate"
    t.string   "gender"
    t.integer  "physician_id"
    t.datetime "date_apointement"
    t.boolean  "is_cancel"
    t.text     "reason_cancel"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "number_invoice"
    t.boolean  "is_invoice",         default: false
    t.boolean  "is_have_diagnostic", default: false
    t.date     "date_invoice"
  end

  add_index "appointments", ["physician_id"], name: "index_appointments_on_physician_id", using: :btree

  create_table "diagnostic_codes", force: true do |t|
    t.text     "description"
    t.string   "code"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthdate"
    t.string   "gender"
    t.string   "user_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "roles",                  default: "--- []"
    t.boolean  "is_change_password",     default: true
    t.string   "user_type"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
