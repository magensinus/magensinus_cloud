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

ActiveRecord::Schema.define(version: 20180118142146) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "magensinus_about", force: :cascade do |t|
    t.string "slug"
    t.string "meta_title"
    t.text "meta_description"
    t.string "meta_image_box"
    t.string "meta_url"
    t.string "title"
    t.text "description"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_magensinus_about_on_slug"
  end

  create_table "magensinus_home", force: :cascade do |t|
    t.string "slug"
    t.string "meta_title"
    t.text "meta_description"
    t.string "meta_image_box"
    t.string "meta_url"
    t.string "title"
    t.text "description"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_magensinus_home_on_slug"
  end

  create_table "magensinus_quality", force: :cascade do |t|
    t.string "slug"
    t.string "meta_title"
    t.text "meta_description"
    t.string "meta_image_box"
    t.string "meta_url"
    t.string "title"
    t.text "description"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_magensinus_quality_on_slug"
  end

  create_table "magensinus_settings", force: :cascade do |t|
    t.string "slug"
    t.string "meta_title"
    t.text "meta_description"
    t.string "meta_image_box"
    t.string "meta_url"
    t.string "title"
    t.text "description"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_magensinus_settings_on_slug"
  end

end
