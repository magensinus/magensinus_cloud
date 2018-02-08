# frozen_string_literal: true

module Academy
  class Course < ApplicationRecord
    # Table name
    # ----------
    # Academy courses
    self.table_name = "academy_courses"

    # Concerns
    # --------
    # Slug
    include Slug
    # Scope lists
    include ScopeLists
    # Clean caption
    include CleanCaption
    # Sortable position
    include SortablePosition

    # Uploaders
    # ---------
    # Thumb
    mount_uploader :thumb_box, Academy::ThumbUploader
    # Cover
    mount_uploader :cover_box, Academy::CoverUploader
    # Document
    mount_uploader :document_box, Academy::DocumentUploader

    # Clean Capitions
    # ---------------
    # Thumb
    after_save(-> { clean_caption(thumb_box, :thumb_caption) })
    # Cover
    after_save(-> { clean_caption(cover_box, :cover_caption) })
    # Document
    after_save(-> { clean_caption(document_box, :document_caption) })

    # Relationships
    # -------------
    # Academy category
    belongs_to :category, optional: true, foreign_key: "academy_category_id", inverse_of: false
    # Academy enrollment courses
    has_many :enrollment_courses, dependent: :destroy, foreign_key: "academy_course_id", inverse_of: false
    # Academy enrollments
    has_many :enrollments, through: :enrollment_courses
    # Academy sections
    has_many :sections, dependent: :destroy, foreign_key: "academy_course_id", inverse_of: false
    accepts_nested_attributes_for :sections
    # Academy course tutors
    has_many :course_tutors, dependent: :destroy, foreign_key: "academy_course_id", inverse_of: false
    # Academy tutors
    has_many :tutors, through: :course_tutors
  end
end
