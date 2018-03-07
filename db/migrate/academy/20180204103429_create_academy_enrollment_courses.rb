# frozen_string_literal: true

class CreateAcademyEnrollmentCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :academy_enrollment_courses do |t|
      t.string  :slug, unique: true, index: true
      # Relationships
      t.integer :academy_enrollment_id, index: true
      t.integer :academy_course_id, index: true

      t.timestamps
    end
  end
end
