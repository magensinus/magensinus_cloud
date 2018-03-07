# frozen_string_literal: true

module Magestil
  class Settings < ApplicationRecord
    # Table name
    # ----------
    # Magestil settings
    self.table_name = "magestil_settings"

    # Concerns
    # --------
    # Slug
    include Slug
    # Clean caption
    include CleanCaption

    # Uploaders
    # ---------
    # Document
    mount_uploader :document_box, Magensinus::DocumentUploader

    # Clean Capitions
    # ---------------
    # Document caption
    after_save(-> { clean_caption(document_box, :document_caption) })
  end
end
