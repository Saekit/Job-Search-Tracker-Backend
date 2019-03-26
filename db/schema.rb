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

ActiveRecord::Schema.define(version: 2019_03_26_182542) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blogs", force: :cascade do |t|
    t.date "date"
    t.integer "amount_completed"
    t.string "url"
    t.bigint "week_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["week_id"], name: "index_blogs_on_week_id"
  end

  create_table "co_of_interests", force: :cascade do |t|
    t.string "company_name"
    t.string "target_contact"
    t.string "my_contact"
    t.bigint "week_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["week_id"], name: "index_co_of_interests_on_week_id"
  end

  create_table "gits", force: :cascade do |t|
    t.date "date"
    t.integer "amount_completed"
    t.bigint "week_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["week_id"], name: "index_gits_on_week_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "company"
    t.string "contact_name_title"
    t.date "date"
    t.string "action"
    t.string "method_contacted"
    t.boolean "first_time_contacting_co"
    t.string "source_referral"
    t.string "job_title"
    t.string "link_to_job_an"
    t.string "notes"
    t.string "next_step"
    t.boolean "action_complete"
    t.string "status"
    t.bigint "week_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["week_id"], name: "index_jobs_on_week_id"
  end

  create_table "one_to_ones", force: :cascade do |t|
    t.date "date"
    t.string "notes"
    t.bigint "week_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["week_id"], name: "index_one_to_ones_on_week_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weeks", force: :cascade do |t|
    t.bigint "user_id"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_weeks_on_user_id"
  end

  add_foreign_key "blogs", "weeks"
  add_foreign_key "co_of_interests", "weeks"
  add_foreign_key "gits", "weeks"
  add_foreign_key "jobs", "weeks"
  add_foreign_key "one_to_ones", "weeks"
  add_foreign_key "weeks", "users"
end
