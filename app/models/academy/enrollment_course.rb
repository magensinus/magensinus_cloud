# frozen_string_literal: true

module Academy
  class EnrollmentCourse < ApplicationRecord
    # Table name
    # ----------
    # Academy enrollment courses
    self.table_name = "academy_enrollment_courses"

    # Concerns
    # --------
    # Slug
    include Slug

    # Relationships
    # -------------
    # Academy enrollment
    belongs_to :enrollment, optional: true, foreign_key: "academy_enrollment_id", inverse_of: false
    accepts_nested_attributes_for :enrollment
    # Academy course
    belongs_to :course, optional: true, foreign_key: "academy_course_id", inverse_of: false
    accepts_nested_attributes_for :course
  end
end
