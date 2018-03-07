# frozen_string_literal: true

class CreateMagestilNetworks < ActiveRecord::Migration[5.1]
  def change
    create_table :magestil_networks do |t|
      t.string  :slug, unique: true, index: true
      # Misc
      t.string  :title
      t.string  :username
      t.string  :url
      t.integer :position
      # Thumb
      t.boolean :thumb, default: false
      t.string  :thumb_box
      t.string  :thumb_caption

      t.timestamps
    end
  end
end
