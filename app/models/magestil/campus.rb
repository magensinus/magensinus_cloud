# frozen_string_literal: true

module Magestil
  class Campus < ApplicationRecord
    # Table name
    # ----------
    # Magestil campus
    self.table_name = "magestil_campus"

    # Concerns
    # --------
    # Slug
    include Slug
    # Clean caption
    include CleanCaption

    # Uploaders
    # ---------
    # Image
    mount_uploader :image_box, Magestil::ImageUploader
    # Document
    mount_uploader :document_box, Magestil::DocumentUploader

    # Clean Capitions
    # ---------------
    # Image caption
    after_save(-> { clean_caption(image_box, :image_caption) })
    # Document caption
    after_save(-> { clean_caption(document_box, :document_caption) })
  end
end
