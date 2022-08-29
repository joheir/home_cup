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

ActiveRecord::Schema[7.0].define(version: 2022_08_29_141635) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
  end

  create_table "profile_tasks", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.boolean "done", default: false
    t.bigint "task_template_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_profile_tasks_on_profile_id"
    t.index ["task_template_id"], name: "index_profile_tasks_on_task_template_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.boolean "admin", default: false
    t.integer "age"
    t.string "picture"
    t.bigint "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_profiles_on_account_id"
  end

  create_table "task_templates", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.string "weekday"
    t.string "title"
    t.string "description"
    t.integer "min_age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_task_templates_on_account_id"
  end

  add_foreign_key "profile_tasks", "profiles"
  add_foreign_key "profile_tasks", "task_templates"
  add_foreign_key "profiles", "accounts"
  add_foreign_key "task_templates", "accounts"
end
