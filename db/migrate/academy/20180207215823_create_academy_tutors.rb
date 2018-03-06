# frozen_string_literal: true

class CreateAcademyTutors < ActiveRecord::Migration[5.1]
  def change
    create_table :academy_tutors do |t|
      t.string  :slug, unique: true, index: true

      t.string  :name
      t.string  :surname
      t.text    :biography

      # Image
      t.boolean :image, default: false
      t.string  :image_box
      t.boolean :image_eml, default: false
      t.string  :image_box_eml
      t.boolean :image_magestil, default: false
      t.string  :image_box_magestil
      t.boolean :image_magensinus, default: false
      t.string  :image_box_magensinus
      t.string  :image_caption

      t.integer :position

      t.timestamps
    end
  end
end
