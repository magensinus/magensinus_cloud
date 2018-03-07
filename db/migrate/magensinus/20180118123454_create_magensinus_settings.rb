# frozen_string_literal: true

class CreateMagensinusSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :magensinus_settings do |t|
      t.string  :slug, unique: true, index: true
      # Meta tags
      t.string  :meta_title
      t.text    :meta_description
      t.string  :meta_image_box
      t.string  :meta_url
      # Misc
      t.string  :title
      t.text    :description
      t.string  :url
      t.text    :enrollment_success
      t.text    :enrollment_failure
      t.text    :enrollment_description
      t.text    :newsletter_success
      t.text    :newsletter_failure
      # Document
      t.boolean :document, default: false
      t.string  :document_box
      t.string  :document_caption

      t.timestamps
    end
  end
end
