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

ActiveRecord::Schema.define(version: 20170501203910) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "course_depts", force: :cascade do |t|
    t.bigint "course_id"
    t.bigint "department_id"
    t.index ["course_id"], name: "index_course_depts_on_course_id"
    t.index ["department_id"], name: "index_course_depts_on_department_id"
  end

  create_table "courses", primary_key: "name", id: :string, force: :cascade do |t|
    t.string "codes", limit: 8, default: [], array: true
    t.string "description"
    t.integer "number", limit: 2
  end

  create_table "departments", primary_key: "abbrev", id: :string, limit: 4, force: :cascade do |t|
    t.string "name", null: false
    t.string "page_address"
    t.string "header_image_name"
  end

  create_table "images", id: false, force: :cascade do |t|
    t.string "file_name", limit: 80
    t.string "author_name", limit: 80
    t.string "author_address", limit: 255
    t.string "image_address", limit: 255
    t.string "license", limit: 80
    t.string "name", limit: 80, default: "Photo"
  end

  create_table "models", force: :cascade do |t|
    t.string "name"
  end

end
