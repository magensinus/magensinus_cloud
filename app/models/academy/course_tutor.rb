# frozen_string_literal: true

module Academy
  class CourseTutor < ApplicationRecord
    # Table name
    # ----------
    # Academy course tutors
    self.table_name = "academy_course_tutors"

    # Concerns
    # --------
    # Slug
    include Slug

    # Relationships
    # -------------
    # Academy course
    belongs_to :course, optional: true, foreign_key: "academy_course_id", inverse_of: false
    # Academy tutor
    belongs_to :tutor, optional: true, foreign_key: "academy_tutor_id", inverse_of: false
  end
end
