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

ActiveRecord::Schema.define(version: 20160823213148) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "bookmarks", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "ttxid"
    t.index ["user_id"], name: "index_bookmarks_on_user_id", using: :btree
  end

  create_table "businesses", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "ttxid"
    t.integer  "certificate_number"
    t.string   "ownership_name"
    t.string   "dba_name"
    t.string   "full_business_address"
    t.string   "city"
    t.string   "state"
    t.integer  "business_zip"
    t.date     "dba_start_date"
    t.date     "dba_end_date"
    t.date     "location_start_date"
    t.date     "location_end_date"
    t.string   "mailing_address_1"
    t.string   "mailing_city_state_zip_code"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.hstore   "location"
    t.index ["user_id"], name: "index_businesses_on_user_id", using: :btree
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "bookmarks", "users"
  add_foreign_key "businesses", "users"
end
