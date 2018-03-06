# frozen_string_literal: true

class CreateJournalArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :journal_articles do |t|
      t.string    :slug, unique: true, index: true

      t.string    :meta_title
      t.text      :meta_description
      t.string    :meta_image_box
      t.string    :meta_url

      t.string    :title
      t.text      :description

      # Thumb
      t.boolean   :thumb, default: false
      t.string    :thumb_box
      t.boolean   :thumb_eml, default: false
      t.string    :thumb_box_eml
      t.boolean   :thumb_magestil, default: false
      t.string    :thumb_box_magestil
      t.boolean   :thumb_magensinus, default: false
      t.string    :thumb_box_magensinus
      t.string    :thumb_caption

      # Cover
      t.boolean   :cover, default: false
      t.string    :cover_box
      t.boolean   :cover_eml, default: false
      t.string    :cover_box_eml
      t.boolean   :cover_magestil, default: false
      t.string    :cover_box_magestil
      t.boolean   :cover_magensinus, default: false
      t.string    :cover_box_magensinus
      t.string    :cover_caption

      # Image
      t.boolean   :image, default: false
      t.string    :image_box
      t.boolean   :image_eml, default: false
      t.string    :image_box_eml
      t.boolean   :image_magestil, default: false
      t.string    :image_box_magestil
      t.boolean   :image_magensinus, default: false
      t.string    :image_box_magensinus
      t.string    :image_caption

      # Other
      t.boolean   :published, default: false
      t.datetime  :published_at

      # Schools
      t.boolean   :eml, default: false
      t.boolean   :magestil, default: false
      t.boolean   :magensinus, default: false

      t.timestamps
    end
  end
end
