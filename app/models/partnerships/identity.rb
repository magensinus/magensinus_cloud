# frozen_string_literal: true

module Partnerships
  class Identity < ApplicationRecord
    # Table name
    # ----------
    # Partnerships identities
    self.table_name = "partnerships_identities"

    # Concerns
    # --------
    # Slug
    include Slug
    # Scope lists
    include ScopeLists

    # Uploaders
    # ---------
    # Thumb
    mount_uploader :thumb_box, Partnerships::ThumbUploader
    mount_uploader :thumb_box_eml, Partnerships::ThumbUploader
    mount_uploader :thumb_box_magestil, Partnerships::ThumbUploader
    mount_uploader :thumb_box_magensinus, Partnerships::ThumbUploader
    # Cover
    mount_uploader :cover_box, Partnerships::CoverUploader
    mount_uploader :cover_box_eml, Partnerships::CoverUploader
    mount_uploader :cover_box_magestil, Partnerships::CoverUploader
    mount_uploader :cover_box_magensinus, Partnerships::CoverUploader
    # Image
    mount_uploader :image_box, Partnerships::ImageUploader
    mount_uploader :image_box_eml, Partnerships::ImageUploader
    mount_uploader :image_box_magestil, Partnerships::ImageUploader
    mount_uploader :image_box_magensinus, Partnerships::ImageUploader
    # Document
    mount_uploader :document_box, Partnerships::DocumentUploader
    mount_uploader :document_box_eml, Partnerships::DocumentUploader
    mount_uploader :document_box_magestil, Partnerships::DocumentUploader
    mount_uploader :document_box_magensinus, Partnerships::DocumentUploader
  end
end
