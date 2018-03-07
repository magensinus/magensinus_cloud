# frozen_string_literal: true

module Endorsement
  class Badge < ApplicationRecord
    # Table name
    # ----------
    # Endorsement badges
    self.table_name = "endorsement_badges"

    # Concerns
    # --------
    # Slug
    include Slug
    # Scope lists
    include ScopeLists

    # Uploaders
    # ---------
    # Thumb
    mount_uploader :thumb_box, Endorsement::ThumbUploader
    mount_uploader :thumb_box_eml, Endorsement::ThumbUploader
    mount_uploader :thumb_box_magestil, Endorsement::ThumbUploader
    mount_uploader :thumb_box_magensinus, Endorsement::ThumbUploader
    # Cover
    mount_uploader :cover_box, Endorsement::CoverUploader
    mount_uploader :cover_box_eml, Endorsement::CoverUploader
    mount_uploader :cover_box_magestil, Endorsement::CoverUploader
    mount_uploader :cover_box_magensinus, Endorsement::CoverUploader
    # Image
    mount_uploader :image_box, Endorsement::ImageUploader
    mount_uploader :image_box_eml, Endorsement::ImageUploader
    mount_uploader :image_box_magestil, Endorsement::ImageUploader
    mount_uploader :image_box_magensinus, Endorsement::ImageUploader
    # Document
    mount_uploader :document_box, Endorsement::DocumentUploader
    mount_uploader :document_box_eml, Endorsement::DocumentUploader
    mount_uploader :document_box_magestil, Endorsement::DocumentUploader
    mount_uploader :document_box_magensinus, Endorsement::DocumentUploader
  end
end
