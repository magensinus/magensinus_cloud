# frozen_string_literal: true

class CreateMagensinusSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :magensinus_settings do |t|
      t.string  :slug, unique: true, index: true

      t.string  :meta_title
      t.text    :meta_description
      t.string  :meta_image_box
      t.string  :meta_url

      t.string  :title
      t.text    :description
      t.string  :url

      t.text    :enrollment_success
      t.text    :enrollment_failure
      t.text    :enrollment_description

      t.text    :newsletter_success
      t.text    :newsletter_failure

      t.timestamps
    end
  end
end
