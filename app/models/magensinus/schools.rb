# frozen_string_literal: true

module Magensinus
  class Schools < ApplicationRecord
    # Table name
    # ----------
    # Magensinus schools
    self.table_name = "magensinus_schools"

    # Concerns
    # --------
    # Slug
    include Slug
    # Clean caption
    include CleanCaption

    # Uploaders
    # ---------
    # Image
    mount_uploader :image_box, Magensinus::ImageUploader
    # Document
    mount_uploader :document_box, Magensinus::DocumentUploader

    # Clean Capitions
    # ---------------
    # Image caption
    after_save(-> { clean_caption(image_box, :image_caption) })
    # Document caption
    after_save(-> { clean_caption(document_box, :document_caption) })
  end
end
