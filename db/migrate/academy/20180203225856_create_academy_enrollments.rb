# frozen_string_literal: true

class CreateAcademyEnrollments < ActiveRecord::Migration[5.1]
  def change
    create_table :academy_enrollments do |t|
      # Relationships
      # Academy category
      t.references  :academy_category, foreign_key: true, index: true

      t.string      :slug, unique: true, index: true

      t.string      :email

      t.timestamps
    end
  end
end
