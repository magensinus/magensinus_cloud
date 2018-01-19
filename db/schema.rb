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

ActiveRecord::Schema.define(version: 20180118170648) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "journal_articles", force: :cascade do |t|
    t.string "slug"
    t.string "meta_title"
    t.text "meta_description"
    t.string "meta_image_box"
    t.string "meta_url"
    t.string "title"
    t.text "description"
    t.boolean "thumb", default: false
    t.string "thumb_box"
    t.string "thumb_caption"
    t.boolean "cover", default: false
    t.string "cover_box"
    t.string "cover_caption"
    t.boolean "published", default: false
    t.datetime "publish_at"
    t.boolean "eml", default: false
    t.boolean "magestil", default: false
    t.boolean "magensinus", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_journal_articles_on_slug"
  end

  create_table "journal_assets", force: :cascade do |t|
    t.bigint "journal_article_id"
    t.string "slug"
    t.boolean "text", default: false
    t.text "text_box"
    t.boolean "image", default: false
    t.string "image_box"
    t.text "image_caption"
    t.boolean "video", default: false
    t.string "video_box"
    t.string "video_caption"
    t.string "video_service"
    t.string "alignment"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["journal_article_id"], name: "index_journal_assets_on_journal_article_id"
    t.index ["slug"], name: "index_journal_assets_on_slug"
  end

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

  create_table "magensinus_articles", force: :cascade do |t|
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
    t.index ["slug"], name: "index_magensinus_articles_on_slug"
  end

  create_table "magensinus_contact", force: :cascade do |t|
    t.string "slug"
    t.string "meta_title"
    t.text "meta_description"
    t.string "meta_image_box"
    t.string "meta_url"
    t.string "title"
    t.text "description"
    t.text "body"
    t.string "fax"
    t.string "email"
    t.string "phone"
    t.string "address_one"
    t.string "address_two"
    t.string "postcode"
    t.string "city"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_magensinus_contact_on_slug"
  end

  create_table "magensinus_courses", force: :cascade do |t|
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
    t.index ["slug"], name: "index_magensinus_courses_on_slug"
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

  create_table "magensinus_newsletter", force: :cascade do |t|
    t.string "slug"
    t.string "meta_title"
    t.text "meta_description"
    t.string "meta_image_box"
    t.string "meta_url"
    t.string "title"
    t.text "description"
    t.text "body"
    t.text "success"
    t.text "failure"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_magensinus_newsletter_on_slug"
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

  add_foreign_key "journal_assets", "journal_articles"
end
