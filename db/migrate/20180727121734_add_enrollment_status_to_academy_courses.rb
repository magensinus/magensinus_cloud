# frozen_string_literal: true

class AddEnrollmentStatusToAcademyCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :academy_courses, :enrollment_status, :boolean
  end
end
