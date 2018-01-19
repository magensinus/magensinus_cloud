# frozen_string_literal: true

class CreateWalletCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :wallet_categories do |t|
      t.string    :slug, unique: true, index: true

      t.string    :meta_title
      t.text      :meta_description
      t.string    :meta_image_box
      t.string    :meta_url

      t.string    :title
      t.text      :description

      t.boolean   :thumb, default: false
      t.string    :thumb_box
      t.string    :thumb_caption

      t.boolean   :cover, default: false
      t.string    :cover_box
      t.string    :cover_caption

      t.boolean   :published, default: false

      t.boolean   :eml, default: false
      t.boolean   :magestil, default: false
      t.boolean   :magensinus, default: false

      t.timestamps
    end
  end
end
