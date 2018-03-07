# frozen_string_literal: true

module Magensinus
  class Settings < ApplicationRecord
    # Table name
    # ----------
    # Magensinus settings
    self.table_name = "magensinus_settings"

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
