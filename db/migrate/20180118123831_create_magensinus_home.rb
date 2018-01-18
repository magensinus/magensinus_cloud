# frozen_string_literal: true

class CreateMagensinusHome < ActiveRecord::Migration[5.1]
  def change
    create_table :magensinus_home do |t|
      t.string  :slug, unique: true, index: true

      t.string  :meta_title
      t.text    :meta_description
      t.string  :meta_image_box
      t.string  :meta_url

      t.string  :title
      t.text    :description
      t.text    :body

      t.timestamps
    end
  end
end
