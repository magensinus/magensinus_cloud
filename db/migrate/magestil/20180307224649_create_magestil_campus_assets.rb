# frozen_string_literal: true

class CreateMagestilCampusAssets < ActiveRecord::Migration[5.1]
  def change
    create_table :magestil_campus_assets do |t|
      t.string  :slug, unique: true, index: true
      # Misc
      t.integer :position
      # Image
      t.boolean :image, default: false
      t.string  :image_box
      t.string  :image_caption

      t.timestamps
    end
  end
end
