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
    # Image
    mount_uploader :image_box, Academy::Tutor::ImageUploader

    # Relationships
    # -------------
    # Academy course tutors
    has_many :course_tutors, dependent: :destroy, foreign_key: "academy_tutor_id", inverse_of: false
    # Academy courses
    has_many :courses, through: :course_tutors
  end
end
