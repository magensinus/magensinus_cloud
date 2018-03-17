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

ActiveRecord::Schema.define(version: 20180317120752) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "academy_categories", force: :cascade do |t|
    t.string "slug"
    t.string "meta_title"
    t.text "meta_description"
    t.string "meta_image_box"
    t.string "meta_url"
    t.string "title"
    t.text "description"
    t.boolean "published", default: false
    t.datetime "published_at"
    t.integer "position"
    t.string "form_type", default: "basic"
    t.string "email"
    t.boolean "eml", default: false
    t.boolean "magestil", default: false
    t.boolean "magensinus", default: false
    t.boolean "thumb", default: false
    t.string "thumb_box"
    t.boolean "thumb_eml", default: false
    t.string "thumb_box_eml"
    t.boolean "thumb_magestil", default: false
    t.string "thumb_box_magestil"
    t.boolean "thumb_magensinus", default: false
    t.string "thumb_box_magensinus"
    t.string "thumb_caption"
    t.boolean "cover", default: false
    t.string "cover_box"
    t.boolean "cover_eml", default: false
    t.string "cover_box_eml"
    t.boolean "cover_magestil", default: false
    t.string "cover_box_magestil"
    t.boolean "cover_magensinus", default: false
    t.string "cover_box_magensinus"
    t.string "cover_caption"
    t.boolean "image", default: false
    t.string "image_box"
    t.boolean "image_eml", default: false
    t.string "image_box_eml"
    t.boolean "image_magestil", default: false
    t.string "image_box_magestil"
    t.boolean "image_magensinus", default: false
    t.string "image_box_magensinus"
    t.string "image_caption"
    t.boolean "document", default: false
    t.string "document_box"
    t.boolean "document_eml", default: false
    t.string "document_box_eml"
    t.boolean "document_magestil", default: false
    t.string "document_box_magestil"
    t.boolean "document_magensinus", default: false
    t.string "document_box_magensinus"
    t.string "document_caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_academy_categories_on_slug"
  end

  create_table "academy_course_tutors", force: :cascade do |t|
    t.string "slug"
    t.bigint "academy_course_id"
    t.bigint "academy_tutor_id"
    t.boolean "coordinator", default: false
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["academy_course_id"], name: "index_academy_course_tutors_on_academy_course_id"
    t.index ["academy_tutor_id"], name: "index_academy_course_tutors_on_academy_tutor_id"
    t.index ["slug"], name: "index_academy_course_tutors_on_slug"
  end

  create_table "academy_courses", force: :cascade do |t|
    t.string "slug"
    t.bigint "academy_category_id"
    t.string "meta_title"
    t.text "meta_description"
    t.string "meta_image_box"
    t.string "meta_url"
    t.string "title"
    t.text "description"
    t.text "body"
    t.text "misc"
    t.boolean "published", default: false
    t.datetime "published_at"
    t.integer "position"
    t.string "gradient_color_one"
    t.string "gradient_color_two"
    t.string "gradient_color_fallback"
    t.string "font_color_one"
    t.string "font_color_two"
    t.string "hover_color_one"
    t.string "hover_color_two"
    t.string "background_color_one"
    t.string "background_color_two"
    t.boolean "eml", default: false
    t.boolean "magestil", default: false
    t.boolean "magensinus", default: false
    t.boolean "thumb", default: false
    t.string "thumb_box"
    t.boolean "thumb_eml", default: false
    t.string "thumb_box_eml"
    t.boolean "thumb_magestil", default: false
    t.string "thumb_box_magestil"
    t.boolean "thumb_magensinus", default: false
    t.string "thumb_box_magensinus"
    t.string "thumb_caption"
    t.boolean "cover", default: false
    t.string "cover_box"
    t.boolean "cover_eml", default: false
    t.string "cover_box_eml"
    t.boolean "cover_magestil", default: false
    t.string "cover_box_magestil"
    t.boolean "cover_magensinus", default: false
    t.string "cover_box_magensinus"
    t.string "cover_caption"
    t.boolean "image", default: false
    t.string "image_box"
    t.boolean "image_eml", default: false
    t.string "image_box_eml"
    t.boolean "image_magestil", default: false
    t.string "image_box_magestil"
    t.boolean "image_magensinus", default: false
    t.string "image_box_magensinus"
    t.string "image_caption"
    t.boolean "document", default: false
    t.string "document_box"
    t.boolean "document_eml", default: false
    t.string "document_box_eml"
    t.boolean "document_magestil", default: false
    t.string "document_box_magestil"
    t.boolean "document_magensinus", default: false
    t.string "document_box_magensinus"
    t.string "document_caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "external"
    t.string "url"
    t.index ["academy_category_id"], name: "index_academy_courses_on_academy_category_id"
    t.index ["slug"], name: "index_academy_courses_on_slug"
  end

  create_table "academy_enrollment_courses", force: :cascade do |t|
    t.string "slug"
    t.integer "academy_enrollment_id"
    t.integer "academy_course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["academy_course_id"], name: "index_academy_enrollment_courses_on_academy_course_id"
    t.index ["academy_enrollment_id"], name: "index_academy_enrollment_courses_on_academy_enrollment_id"
    t.index ["slug"], name: "index_academy_enrollment_courses_on_slug"
  end

  create_table "academy_enrollments", force: :cascade do |t|
    t.string "slug"
    t.bigint "academy_category_id"
    t.string "name"
    t.string "surname"
    t.date "dob"
    t.string "email"
    t.string "phone"
    t.string "address_one"
    t.string "address_two"
    t.string "postcode"
    t.string "city"
    t.string "country"
    t.string "secondary_name"
    t.string "secondary_surname"
    t.string "secondary_email"
    t.string "secondary_phone"
    t.boolean "accept_terms", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["academy_category_id"], name: "index_academy_enrollments_on_academy_category_id"
    t.index ["slug"], name: "index_academy_enrollments_on_slug"
  end

  create_table "academy_schools", force: :cascade do |t|
    t.string "slug"
    t.string "meta_title"
    t.text "meta_description"
    t.string "meta_image_box"
    t.string "meta_url"
    t.string "title"
    t.text "description"
    t.string "url"
    t.boolean "published", default: false
    t.datetime "published_at"
    t.integer "position"
    t.boolean "eml", default: false
    t.boolean "magestil", default: false
    t.boolean "magensinus", default: false
    t.boolean "thumb", default: false
    t.string "thumb_box"
    t.boolean "thumb_eml", default: false
    t.string "thumb_box_eml"
    t.boolean "thumb_magestil", default: false
    t.string "thumb_box_magestil"
    t.boolean "thumb_magensinus", default: false
    t.string "thumb_box_magensinus"
    t.string "thumb_caption"
    t.boolean "cover", default: false
    t.string "cover_box"
    t.boolean "cover_eml", default: false
    t.string "cover_box_eml"
    t.boolean "cover_magestil", default: false
    t.string "cover_box_magestil"
    t.boolean "cover_magensinus", default: false
    t.string "cover_box_magensinus"
    t.string "cover_caption"
    t.boolean "image", default: false
    t.string "image_box"
    t.boolean "image_eml", default: false
    t.string "image_box_eml"
    t.boolean "image_magestil", default: false
    t.string "image_box_magestil"
    t.boolean "image_magensinus", default: false
    t.string "image_box_magensinus"
    t.string "image_caption"
    t.boolean "document", default: false
    t.string "document_box"
    t.boolean "document_eml", default: false
    t.string "document_box_eml"
    t.boolean "document_magestil", default: false
    t.string "document_box_magestil"
    t.boolean "document_magensinus", default: false
    t.string "document_box_magensinus"
    t.string "document_caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_academy_schools_on_slug"
  end

  create_table "academy_section_assets", force: :cascade do |t|
    t.string "slug"
    t.bigint "academy_section_id"
    t.string "alignment"
    t.integer "position"
    t.boolean "text"
    t.text "text_box"
    t.boolean "image", default: false
    t.string "image_box"
    t.string "image_caption"
    t.boolean "document", default: false
    t.string "document_box"
    t.string "document_caption"
    t.boolean "video", default: false
    t.string "video_box"
    t.string "video_caption"
    t.string "video_service"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["academy_section_id"], name: "index_academy_section_assets_on_academy_section_id"
    t.index ["slug"], name: "index_academy_section_assets_on_slug"
  end

  create_table "academy_sections", force: :cascade do |t|
    t.string "slug"
    t.bigint "academy_course_id"
    t.string "title"
    t.boolean "published", default: false
    t.datetime "published_at"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["academy_course_id"], name: "index_academy_sections_on_academy_course_id"
    t.index ["slug"], name: "index_academy_sections_on_slug"
  end

  create_table "academy_tutors", force: :cascade do |t|
    t.string "slug"
    t.string "name"
    t.string "surname"
    t.text "biography"
    t.integer "position"
    t.boolean "thumb", default: false
    t.string "thumb_box"
    t.boolean "thumb_eml", default: false
    t.string "thumb_box_eml"
    t.boolean "thumb_magestil", default: false
    t.string "thumb_box_magestil"
    t.boolean "thumb_magensinus", default: false
    t.string "thumb_box_magensinus"
    t.string "thumb_caption"
    t.boolean "cover", default: false
    t.string "cover_box"
    t.boolean "cover_eml", default: false
    t.string "cover_box_eml"
    t.boolean "cover_magestil", default: false
    t.string "cover_box_magestil"
    t.boolean "cover_magensinus", default: false
    t.string "cover_box_magensinus"
    t.string "cover_caption"
    t.boolean "image", default: false
    t.string "image_box"
    t.boolean "image_eml", default: false
    t.string "image_box_eml"
    t.boolean "image_magestil", default: false
    t.string "image_box_magestil"
    t.boolean "image_magensinus", default: false
    t.string "image_box_magensinus"
    t.string "image_caption"
    t.boolean "document", default: false
    t.string "document_box"
    t.boolean "document_eml", default: false
    t.string "document_box_eml"
    t.boolean "document_magestil", default: false
    t.string "document_box_magestil"
    t.boolean "document_magensinus", default: false
    t.string "document_box_magensinus"
    t.string "document_caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_academy_tutors_on_slug"
  end

  create_table "endorsement_badges", force: :cascade do |t|
    t.string "slug"
    t.string "title"
    t.text "description"
    t.string "url"
    t.boolean "published", default: false
    t.datetime "published_at"
    t.integer "position"
    t.boolean "eml", default: false
    t.boolean "magestil", default: false
    t.boolean "magensinus", default: false
    t.boolean "thumb", default: false
    t.string "thumb_box"
    t.boolean "thumb_eml", default: false
    t.string "thumb_box_eml"
    t.boolean "thumb_magestil", default: false
    t.string "thumb_box_magestil"
    t.boolean "thumb_magensinus", default: false
    t.string "thumb_box_magensinus"
    t.string "thumb_caption"
    t.boolean "cover", default: false
    t.string "cover_box"
    t.boolean "cover_eml", default: false
    t.string "cover_box_eml"
    t.boolean "cover_magestil", default: false
    t.string "cover_box_magestil"
    t.boolean "cover_magensinus", default: false
    t.string "cover_box_magensinus"
    t.string "cover_caption"
    t.boolean "image", default: false
    t.string "image_box"
    t.boolean "image_eml", default: false
    t.string "image_box_eml"
    t.boolean "image_magestil", default: false
    t.string "image_box_magestil"
    t.boolean "image_magensinus", default: false
    t.string "image_box_magensinus"
    t.string "image_caption"
    t.boolean "document", default: false
    t.string "document_box"
    t.boolean "document_eml", default: false
    t.string "document_box_eml"
    t.boolean "document_magestil", default: false
    t.string "document_box_magestil"
    t.boolean "document_magensinus", default: false
    t.string "document_box_magensinus"
    t.string "document_caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_endorsement_badges_on_slug"
  end

  create_table "journal_articles", force: :cascade do |t|
    t.string "slug"
    t.string "meta_title"
    t.text "meta_description"
    t.string "meta_image_box"
    t.string "meta_url"
    t.string "title"
    t.text "description"
    t.boolean "published", default: false
    t.datetime "published_at"
    t.boolean "eml", default: false
    t.boolean "magestil", default: false
    t.boolean "magensinus", default: false
    t.boolean "thumb", default: false
    t.string "thumb_box"
    t.boolean "thumb_eml", default: false
    t.string "thumb_box_eml"
    t.boolean "thumb_magestil", default: false
    t.string "thumb_box_magestil"
    t.boolean "thumb_magensinus", default: false
    t.string "thumb_box_magensinus"
    t.string "thumb_caption"
    t.boolean "cover", default: false
    t.string "cover_box"
    t.boolean "cover_eml", default: false
    t.string "cover_box_eml"
    t.boolean "cover_magestil", default: false
    t.string "cover_box_magestil"
    t.boolean "cover_magensinus", default: false
    t.string "cover_box_magensinus"
    t.string "cover_caption"
    t.boolean "image", default: false
    t.string "image_box"
    t.boolean "image_eml", default: false
    t.string "image_box_eml"
    t.boolean "image_magestil", default: false
    t.string "image_box_magestil"
    t.boolean "image_magensinus", default: false
    t.string "image_box_magensinus"
    t.string "image_caption"
    t.boolean "document", default: false
    t.string "document_box"
    t.boolean "document_eml", default: false
    t.string "document_box_eml"
    t.boolean "document_magestil", default: false
    t.string "document_box_magestil"
    t.boolean "document_magensinus", default: false
    t.string "document_box_magensinus"
    t.string "document_caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_journal_articles_on_slug"
  end

  create_table "journal_assets", force: :cascade do |t|
    t.string "slug"
    t.bigint "journal_article_id"
    t.string "alignment"
    t.integer "position"
    t.boolean "text"
    t.text "text_box"
    t.boolean "image", default: false
    t.string "image_box"
    t.string "image_caption"
    t.boolean "document", default: false
    t.string "document_box"
    t.string "document_caption"
    t.boolean "video", default: false
    t.string "video_box"
    t.string "video_caption"
    t.string "video_service"
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
    t.boolean "image", default: false
    t.string "image_box"
    t.string "image_caption"
    t.boolean "document", default: false
    t.string "document_box"
    t.string "document_caption"
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
    t.boolean "image", default: false
    t.string "image_box"
    t.string "image_caption"
    t.boolean "document", default: false
    t.string "document_box"
    t.string "document_caption"
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
    t.boolean "image", default: false
    t.string "image_box"
    t.string "image_caption"
    t.boolean "document", default: false
    t.string "document_box"
    t.string "document_caption"
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
    t.boolean "image", default: false
    t.string "image_box"
    t.string "image_caption"
    t.boolean "document", default: false
    t.string "document_box"
    t.string "document_caption"
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
    t.boolean "image", default: false
    t.string "image_box"
    t.string "image_caption"
    t.boolean "document", default: false
    t.string "document_box"
    t.string "document_caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "subtitle"
    t.index ["slug"], name: "index_magensinus_home_on_slug"
  end

  create_table "magensinus_networks", force: :cascade do |t|
    t.string "slug"
    t.string "title"
    t.string "username"
    t.string "url"
    t.integer "position"
    t.boolean "thumb", default: false
    t.string "thumb_box"
    t.string "thumb_caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_magensinus_networks_on_slug"
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
    t.boolean "image", default: false
    t.string "image_box"
    t.string "image_caption"
    t.boolean "document", default: false
    t.string "document_box"
    t.string "document_caption"
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
    t.boolean "image", default: false
    t.string "image_box"
    t.string "image_caption"
    t.boolean "document", default: false
    t.string "document_box"
    t.string "document_caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_magensinus_quality_on_slug"
  end

  create_table "magensinus_schools", force: :cascade do |t|
    t.string "slug"
    t.string "meta_title"
    t.text "meta_description"
    t.string "meta_image_box"
    t.string "meta_url"
    t.string "title"
    t.text "description"
    t.text "body"
    t.boolean "image", default: false
    t.string "image_box"
    t.string "image_caption"
    t.boolean "document", default: false
    t.string "document_box"
    t.string "document_caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_magensinus_schools_on_slug"
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
    t.text "enrollment_success"
    t.text "enrollment_failure"
    t.text "enrollment_description"
    t.text "newsletter_success"
    t.text "newsletter_failure"
    t.boolean "document", default: false
    t.string "document_box"
    t.string "document_caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_magensinus_settings_on_slug"
  end

  create_table "magestil_about", force: :cascade do |t|
    t.string "slug"
    t.string "meta_title"
    t.text "meta_description"
    t.string "meta_image_box"
    t.string "meta_url"
    t.string "title"
    t.text "description"
    t.text "body"
    t.boolean "image", default: false
    t.string "image_box"
    t.string "image_caption"
    t.boolean "document", default: false
    t.string "document_box"
    t.string "document_caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_magestil_about_on_slug"
  end

  create_table "magestil_articles", force: :cascade do |t|
    t.string "slug"
    t.string "meta_title"
    t.text "meta_description"
    t.string "meta_image_box"
    t.string "meta_url"
    t.string "title"
    t.text "description"
    t.text "body"
    t.boolean "image", default: false
    t.string "image_box"
    t.string "image_caption"
    t.boolean "document", default: false
    t.string "document_box"
    t.string "document_caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_magestil_articles_on_slug"
  end

  create_table "magestil_campus", force: :cascade do |t|
    t.string "slug"
    t.string "meta_title"
    t.text "meta_description"
    t.string "meta_image_box"
    t.string "meta_url"
    t.string "title"
    t.text "description"
    t.text "body"
    t.boolean "image", default: false
    t.string "image_box"
    t.string "image_caption"
    t.boolean "document", default: false
    t.string "document_box"
    t.string "document_caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_magestil_campus_on_slug"
  end

  create_table "magestil_campus_assets", force: :cascade do |t|
    t.string "slug"
    t.integer "position"
    t.boolean "image", default: false
    t.string "image_box"
    t.string "image_caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_magestil_campus_assets_on_slug"
  end

  create_table "magestil_contact", force: :cascade do |t|
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
    t.boolean "image", default: false
    t.string "image_box"
    t.string "image_caption"
    t.boolean "document", default: false
    t.string "document_box"
    t.string "document_caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_magestil_contact_on_slug"
  end

  create_table "magestil_courses", force: :cascade do |t|
    t.string "slug"
    t.string "meta_title"
    t.text "meta_description"
    t.string "meta_image_box"
    t.string "meta_url"
    t.string "title"
    t.text "description"
    t.text "body"
    t.boolean "image", default: false
    t.string "image_box"
    t.string "image_caption"
    t.boolean "document", default: false
    t.string "document_box"
    t.string "document_caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_magestil_courses_on_slug"
  end

  create_table "magestil_equipment", force: :cascade do |t|
    t.string "slug"
    t.string "meta_title"
    t.text "meta_description"
    t.string "meta_image_box"
    t.string "meta_url"
    t.string "title"
    t.text "description"
    t.text "body"
    t.boolean "image", default: false
    t.string "image_box"
    t.string "image_caption"
    t.boolean "document", default: false
    t.string "document_box"
    t.string "document_caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_magestil_equipment_on_slug"
  end

  create_table "magestil_equipment_assets", force: :cascade do |t|
    t.string "slug"
    t.integer "position"
    t.boolean "image", default: false
    t.string "image_box"
    t.string "image_caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_magestil_equipment_assets_on_slug"
  end

  create_table "magestil_home", force: :cascade do |t|
    t.string "slug"
    t.string "meta_title"
    t.text "meta_description"
    t.string "meta_image_box"
    t.string "meta_url"
    t.string "title"
    t.text "description"
    t.text "body"
    t.boolean "image", default: false
    t.string "image_box"
    t.string "image_caption"
    t.boolean "document", default: false
    t.string "document_box"
    t.string "document_caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_magestil_home_on_slug"
  end

  create_table "magestil_networks", force: :cascade do |t|
    t.string "slug"
    t.string "title"
    t.string "username"
    t.string "url"
    t.integer "position"
    t.boolean "thumb", default: false
    t.string "thumb_box"
    t.string "thumb_caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_magestil_networks_on_slug"
  end

  create_table "magestil_newsletter", force: :cascade do |t|
    t.string "slug"
    t.string "meta_title"
    t.text "meta_description"
    t.string "meta_image_box"
    t.string "meta_url"
    t.string "title"
    t.text "description"
    t.text "body"
    t.boolean "image", default: false
    t.string "image_box"
    t.string "image_caption"
    t.boolean "document", default: false
    t.string "document_box"
    t.string "document_caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_magestil_newsletter_on_slug"
  end

  create_table "magestil_parents", force: :cascade do |t|
    t.string "slug"
    t.string "meta_title"
    t.text "meta_description"
    t.string "meta_image_box"
    t.string "meta_url"
    t.string "title"
    t.text "description"
    t.text "body"
    t.boolean "image", default: false
    t.string "image_box"
    t.string "image_caption"
    t.boolean "document", default: false
    t.string "document_box"
    t.string "document_caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_magestil_parents_on_slug"
  end

  create_table "magestil_partnerships", force: :cascade do |t|
    t.string "slug"
    t.string "meta_title"
    t.text "meta_description"
    t.string "meta_image_box"
    t.string "meta_url"
    t.string "title"
    t.text "description"
    t.text "body"
    t.boolean "image", default: false
    t.string "image_box"
    t.string "image_caption"
    t.boolean "document", default: false
    t.string "document_box"
    t.string "document_caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_magestil_partnerships_on_slug"
  end

  create_table "magestil_settings", force: :cascade do |t|
    t.string "slug"
    t.string "meta_title"
    t.text "meta_description"
    t.string "meta_image_box"
    t.string "meta_url"
    t.string "title"
    t.text "description"
    t.string "url"
    t.text "enrollment_success"
    t.text "enrollment_failure"
    t.text "enrollment_description"
    t.text "newsletter_success"
    t.text "newsletter_failure"
    t.boolean "document", default: false
    t.string "document_box"
    t.string "document_caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_magestil_settings_on_slug"
  end

  create_table "magestil_students", force: :cascade do |t|
    t.string "slug"
    t.string "meta_title"
    t.text "meta_description"
    t.string "meta_image_box"
    t.string "meta_url"
    t.string "title"
    t.text "description"
    t.text "body"
    t.boolean "image", default: false
    t.string "image_box"
    t.string "image_caption"
    t.boolean "document", default: false
    t.string "document_box"
    t.string "document_caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_magestil_students_on_slug"
  end

  create_table "magestil_tutors", force: :cascade do |t|
    t.string "slug"
    t.string "meta_title"
    t.text "meta_description"
    t.string "meta_image_box"
    t.string "meta_url"
    t.string "title"
    t.text "description"
    t.text "body"
    t.boolean "image", default: false
    t.string "image_box"
    t.string "image_caption"
    t.boolean "document", default: false
    t.string "document_box"
    t.string "document_caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_magestil_tutors_on_slug"
  end

  create_table "partnerships_identities", force: :cascade do |t|
    t.string "slug"
    t.string "title"
    t.text "description"
    t.string "url"
    t.boolean "published", default: false
    t.datetime "published_at"
    t.integer "position"
    t.boolean "eml", default: false
    t.boolean "magestil", default: false
    t.boolean "magensinus", default: false
    t.boolean "thumb", default: false
    t.string "thumb_box"
    t.boolean "thumb_eml", default: false
    t.string "thumb_box_eml"
    t.boolean "thumb_magestil", default: false
    t.string "thumb_box_magestil"
    t.boolean "thumb_magensinus", default: false
    t.string "thumb_box_magensinus"
    t.string "thumb_caption"
    t.boolean "cover", default: false
    t.string "cover_box"
    t.boolean "cover_eml", default: false
    t.string "cover_box_eml"
    t.boolean "cover_magestil", default: false
    t.string "cover_box_magestil"
    t.boolean "cover_magensinus", default: false
    t.string "cover_box_magensinus"
    t.string "cover_caption"
    t.boolean "image", default: false
    t.string "image_box"
    t.boolean "image_eml", default: false
    t.string "image_box_eml"
    t.boolean "image_magestil", default: false
    t.string "image_box_magestil"
    t.boolean "image_magensinus", default: false
    t.string "image_box_magensinus"
    t.string "image_caption"
    t.boolean "document", default: false
    t.string "document_box"
    t.boolean "document_eml", default: false
    t.string "document_box_eml"
    t.boolean "document_magestil", default: false
    t.string "document_box_magestil"
    t.boolean "document_magensinus", default: false
    t.string "document_box_magensinus"
    t.string "document_caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_partnerships_identities_on_slug"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "slug"
    t.string "name"
    t.string "surname"
    t.string "email"
    t.boolean "accept_terms", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_subscriptions_on_slug"
  end

  create_table "wallet_assets", force: :cascade do |t|
    t.string "slug"
    t.bigint "wallet_category_id"
    t.string "alignment"
    t.integer "position"
    t.boolean "document", default: false
    t.string "document_box"
    t.string "document_caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_wallet_assets_on_slug"
    t.index ["wallet_category_id"], name: "index_wallet_assets_on_wallet_category_id"
  end

  create_table "wallet_categories", force: :cascade do |t|
    t.string "slug"
    t.string "meta_title"
    t.text "meta_description"
    t.string "meta_image_box"
    t.string "meta_url"
    t.string "title"
    t.text "description"
    t.boolean "published", default: false
    t.datetime "published_at"
    t.integer "position"
    t.string "wallet_type", default: "student"
    t.boolean "eml", default: false
    t.boolean "magestil", default: false
    t.boolean "magensinus", default: false
    t.boolean "thumb", default: false
    t.string "thumb_box"
    t.boolean "thumb_eml", default: false
    t.string "thumb_box_eml"
    t.boolean "thumb_magestil", default: false
    t.string "thumb_box_magestil"
    t.boolean "thumb_magensinus", default: false
    t.string "thumb_box_magensinus"
    t.string "thumb_caption"
    t.boolean "cover", default: false
    t.string "cover_box"
    t.boolean "cover_eml", default: false
    t.string "cover_box_eml"
    t.boolean "cover_magestil", default: false
    t.string "cover_box_magestil"
    t.boolean "cover_magensinus", default: false
    t.string "cover_box_magensinus"
    t.string "cover_caption"
    t.boolean "image", default: false
    t.string "image_box"
    t.boolean "image_eml", default: false
    t.string "image_box_eml"
    t.boolean "image_magestil", default: false
    t.string "image_box_magestil"
    t.boolean "image_magensinus", default: false
    t.string "image_box_magensinus"
    t.string "image_caption"
    t.boolean "document", default: false
    t.string "document_box"
    t.boolean "document_eml", default: false
    t.string "document_box_eml"
    t.boolean "document_magestil", default: false
    t.string "document_box_magestil"
    t.boolean "document_magensinus", default: false
    t.string "document_box_magensinus"
    t.string "document_caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_wallet_categories_on_slug"
  end

  add_foreign_key "academy_courses", "academy_categories"
  add_foreign_key "academy_enrollments", "academy_categories"
  add_foreign_key "academy_section_assets", "academy_sections"
  add_foreign_key "academy_sections", "academy_courses"
  add_foreign_key "journal_assets", "journal_articles"
  add_foreign_key "wallet_assets", "wallet_categories"
end
