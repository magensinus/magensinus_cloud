# frozen_string_literal: true

class CreateMagestilParents < ActiveRecord::Migration[5.1]
  def change
    create_table :magestil_parents do |t|
      t.string  :slug, unique: true, index: true

      t.string  :meta_title
      t.text    :meta_description
      t.string  :meta_image_box
      t.string  :meta_url

      t.string  :title
      t.text    :description
      t.text    :body

      t.boolean :image, default: false
      t.string  :image_box
      t.string  :image_caption

      t.timestamps
    end
  end
end
