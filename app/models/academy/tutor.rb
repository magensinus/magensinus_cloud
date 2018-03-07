# frozen_string_literal: true

module Academy
  class Tutor < ApplicationRecord
    # Table name
    # ----------
    # Academy Categories
    self.table_name = "academy_tutors"

    # Concerns
    # --------
    # Slug
    include Slug
    # Clean caption
    include CleanCaption
    # Sortable position
    include SortablePosition

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
    # Academy course tutors
    has_many :course_tutors, dependent: :destroy, foreign_key: "academy_tutor_id", inverse_of: false
    accepts_nested_attributes_for :course_tutors
    # Academy courses
    has_many :courses, through: :course_tutors
    accepts_nested_attributes_for :courses
  end
end
