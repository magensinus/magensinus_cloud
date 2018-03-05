# frozen_string_literal: true

module Academy
  class Category < ApplicationRecord
    # Table name
    # ----------
    # Academy Categories
    self.table_name = "academy_categories"

    # Concerns
    # --------
    # Slug
    include Slug
    # Clean caption
    # include CleanCaption
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

    # Clean Capitions
    # ---------------
    # Thumb
    # after_save(-> { clean_caption(thumb_box, :thumb_caption) })
    # Cover
    # after_save(-> { clean_caption(cover_box, :cover_caption) })

    # Relationships
    # -------------
    # Courses
    has_many :courses, dependent: :destroy, foreign_key: "academy_category_id", inverse_of: false
    accepts_nested_attributes_for :courses
    # Enrollments
    has_many :enrollments, dependent: :destroy, foreign_key: "academy_category_id", inverse_of: false
    accepts_nested_attributes_for :enrollments
  end
end
