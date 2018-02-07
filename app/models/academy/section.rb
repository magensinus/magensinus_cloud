# frozen_string_literal: true

module Academy
  class Section < ApplicationRecord
    # Table name
    # ----------
    # Academy courses
    self.table_name = "academy_sections"

    # Concerns
    # --------
    # Slug
    include Slug
    # Sortable position
    include SortablePosition

    # Relationships
    # -------------
    # Course
    belongs_to :course, foreign_key: "academy_course_id", inverse_of: false
    accepts_nested_attributes_for :course
  end
end
