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
    # Academy course
    belongs_to :course, foreign_key: "academy_course_id", inverse_of: false
    accepts_nested_attributes_for :course
    # Academy section assets
    has_many :section_assets, dependent: :destroy, foreign_key: "academy_section_id", inverse_of: false
    accepts_nested_attributes_for :section_assets
  end
end
