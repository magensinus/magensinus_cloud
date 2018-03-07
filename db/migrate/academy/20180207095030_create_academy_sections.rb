# frozen_string_literal: true

class CreateAcademySections < ActiveRecord::Migration[5.1]
  def change
    create_table :academy_sections do |t|
      t.string      :slug, unique: true, index: true
      # Relationships
      t.references  :academy_course, foreign_key: true, index: true
      # Misc
      t.string      :title
      t.boolean     :published, default: false
      t.datetime    :published_at
      t.integer     :position

      t.timestamps
    end
  end
end
