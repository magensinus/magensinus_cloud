# frozen_string_literal: true

class CreateJournalAssets < ActiveRecord::Migration[5.1]
  def change
    create_table :journal_assets do |t|
      t.references  :journal_article, foreign_key: true, index: true
      t.string      :slug, unique: true, index: true

      t.boolean     :text, default: false
      t.text        :text_box

      t.boolean     :image, default: false
      t.string      :image_box
      t.text        :image_caption

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
