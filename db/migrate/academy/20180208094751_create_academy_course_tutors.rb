# frozen_string_literal: true

class CreateAcademyCourseTutors < ActiveRecord::Migration[5.1]
  def change
    create_table :academy_course_tutors do |t|
      # Relationships
      # Academy course
      t.references :academy_course, index: true
      # Academy tutor
      t.references :academy_tutor, index: true

      t.string  :slug, unique: true, index: true

      t.boolean :coordinator, deafult: true

      t.integer :position

      t.timestamps
    end
  end
end
