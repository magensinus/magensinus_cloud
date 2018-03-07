# frozen_string_literal: true

module Academy
  class School < ApplicationRecord
    # Table name
    # ----------
    # Academy Schools
    self.table_name = "academy_schools"

    # Concerns
    # --------
    # Slug
    include Slug
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
  end
end
