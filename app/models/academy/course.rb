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
    # Sortable position
    include SortablePosition
    # Clean video
    include CleanVideo
    # Clean caption
    include CleanCaption

    # Uploaders
    # ---------
    # Thumb
    mount_uploader :thumb_box, Academy::ThumbUploader
    mount_uploader :thumb_box_eml, Academy::ThumbUploader
    mount_uploader :thumb_box_magestil, Academy::ThumbUploader
    mount_uploader :thumb_box_magensinus, Academy::ThumbUploader
    # Cover
    mount_uploader :cover_box, Academy::CoverUploader
    mount_uploader :cover_box_eml, Academy::CoverUploader
    mount_uploader :cover_box_magestil, Academy::CoverUploader
    mount_uploader :cover_box_magensinus, Academy::CoverUploader
    # Image
    mount_uploader :image_box, Academy::ImageUploader
    mount_uploader :image_box_eml, Academy::ImageUploader
    mount_uploader :image_box_magestil, Academy::ImageUploader
    mount_uploader :image_box_magensinus, Academy::ImageUploader
    # Document
    mount_uploader :document_box, Academy::DocumentUploader
    mount_uploader :document_box_eml, Academy::DocumentUploader
    mount_uploader :document_box_magestil, Academy::DocumentUploader
    mount_uploader :document_box_magensinus, Academy::DocumentUploader

    # Relationships
    # -------------
    # Academy category
    belongs_to :category, optional: true, foreign_key: "academy_category_id", inverse_of: false
    # accepts_nested_attributes_for :category
    # Academy enrollment courses
    has_many :enrollment_courses, dependent: :destroy, foreign_key: "academy_course_id", inverse_of: false
    accepts_nested_attributes_for :enrollment_courses
    # Academy enrollments
    has_many :enrollments, through: :enrollment_courses
    accepts_nested_attributes_for :enrollments
    # Academy sections
    has_many :sections, dependent: :destroy, foreign_key: "academy_course_id", inverse_of: false
    accepts_nested_attributes_for :sections
    # Academy course tutors
    has_many :course_tutors, dependent: :destroy, foreign_key: "academy_course_id", inverse_of: false
    accepts_nested_attributes_for :course_tutors
    # Academy tutors
    has_many :tutors, through: :course_tutors
    accepts_nested_attributes_for :tutors

    # Validations
    # -----------
    # Category
    validates_associated :category
    validates :category, presence: true
  end
end
