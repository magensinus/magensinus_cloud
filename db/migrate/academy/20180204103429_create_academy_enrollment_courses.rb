# frozen_string_literal: true

class CreateAcademyEnrollmentCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :academy_enrollment_courses do |t|
      # Relationships
      # Academy enrollment
      t.integer :academy_enrollment_id, index: true
      # Academy course
      t.integer :academy_course_id, index: true

      t.string  :slug, unique: true, index: true

      t.timestamps
    end
  end
end
