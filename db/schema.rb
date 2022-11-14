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

ActiveRecord::Schema[7.0].define(version: 2022_11_14_190807) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "diseases", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "unique_name", unique: true
  end

  create_table "relationships", force: :cascade do |t|
    t.bigint "requesting_user_id", null: false
    t.bigint "requested_user_id", null: false
    t.string "status", null: false
    t.boolean "sexual", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["requested_user_id"], name: "index_relationships_on_requested_user_id"
    t.index ["requesting_user_id", "requested_user_id"], name: "unique_relationship_id", unique: true
    t.index ["requesting_user_id"], name: "index_relationships_on_requesting_user_id"
  end

  create_table "testings", force: :cascade do |t|
    t.bigint "disease_id"
    t.bigint "user_id", null: false
    t.string "notes"
    t.string "status", null: false
    t.string "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disease_id"], name: "index_testings_on_disease_id"
    t.index ["user_id"], name: "index_testings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "invitation_code"
    t.string "password_digest", null: false
    t.string "email", null: false
    t.string "email_confirmation_token"
    t.string "password_reset_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "unique_email", unique: true
    t.index ["invitation_code"], name: "unique_invitation_code", unique: true
  end

  add_foreign_key "relationships", "users", column: "requested_user_id"
  add_foreign_key "relationships", "users", column: "requesting_user_id"
end
