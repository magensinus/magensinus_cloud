# frozen_string_literal: true

class CreateMagensinusNetworks < ActiveRecord::Migration[5.1]
  def change
    create_table :magensinus_networks do |t|
      t.string  :slug, unique: true, index: true

      t.string  :title
      t.string  :username
      t.string  :url

      t.boolean :thumb, default: false
      t.string  :thumb_box
      t.string  :thumb_caption

      t.integer :position

      t.timestamps
    end
  end
end
