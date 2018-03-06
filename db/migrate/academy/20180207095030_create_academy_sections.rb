# frozen_string_literal: true

class CreateAcademySections < ActiveRecord::Migration[5.1]
  def change
    create_table :academy_sections do |t|
      # Relationships
      # Academy course
      t.references  :academy_course, foreign_key: true, index: true

      t.string      :slug, unique: true, index: true

      t.string      :title
      t.boolean     :published, default: false
      t.integer     :position

      t.timestamps
    end
  end
end
