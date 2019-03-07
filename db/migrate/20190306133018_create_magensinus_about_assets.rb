# frozen_string_literal: true

class CreateMagensinusAboutAssets < ActiveRecord::Migration[5.1]
  def change
    create_table :magensinus_about_assets do |t|
      t.string  :slug, unique: true, index: true
      # Misc
      t.integer :position
      t.string  :alignment
      # Text
      t.boolean :text
      t.text    :text_box
      # Image
      t.boolean :image, default: false
      t.string  :image_box
      t.string  :image_caption
      # Document
      t.boolean :document, default: false
      t.string  :document_box
      t.string  :document_caption
      # Video
      t.boolean :video, default: false
      t.string  :video_box
      t.string  :video_caption
      t.string  :video_service

      t.timestamps
    end
  end
end
