# frozen_string_literal: true

class CreateAcademySectionAssets < ActiveRecord::Migration[5.1]
  def change
    create_table :academy_section_assets do |t|
      # Relationships
      # Academy section
      t.references  :academy_section, foreign_key: true, index: true

      t.string      :slug, unique: true, index: true

      t.boolean     :text
      t.text        :text_box

      t.boolean     :image, default: false
      t.string      :image_box
      t.string      :image_caption

      t.boolean     :document, default: false
      t.string      :document_box
      t.string      :document_caption

      t.boolean     :video, default: false
      t.string      :video_box
      t.string      :video_caption
      t.string      :video_service

      t.string      :alignment

      t.integer     :position

      t.timestamps
    end
  end
end

# rails g scaffold AcademySectionAsset academy_section:references slug:string text:boolean text_box:text image:boolean image_box:string image_caption:string document:boolean document_box:string document_caption:string video:boolean video_box:string video_caption:string video_service:string alignment:string position:integer
