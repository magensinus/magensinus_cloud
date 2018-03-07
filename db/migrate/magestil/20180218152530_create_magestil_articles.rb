# frozen_string_literal: true

class CreateMagestilArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :magestil_articles do |t|
      t.string  :slug, unique: true, index: true
      # Meta tags
      t.string  :meta_title
      t.text    :meta_description
      t.string  :meta_image_box
      t.string  :meta_url
      # Misc
      t.string  :title
      t.text    :description
      t.text    :body
      # Image
      t.boolean :image, default: false
      t.string  :image_box
      t.string  :image_caption
      # Document
      t.boolean :document, default: false
      t.string  :document_box
      t.string  :document_caption

      t.timestamps
    end
  end
end
