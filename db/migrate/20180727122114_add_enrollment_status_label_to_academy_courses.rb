# frozen_string_literal: true

class AddEnrollmentStatusLabelToAcademyCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :academy_courses, :enrollment_status_label, :string
  end
end
