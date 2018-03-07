# frozen_string_literal: true

module Magestil
  class Network < ApplicationRecord
    # Table name
    # ----------
    # Magestil network
    self.table_name = "magestil_networks"

    # Concerns
    # --------
    # Slug
    include Slug
    # Clean caption
    include CleanCaption

    # Uploaders
    # ---------
    # Thumb
    mount_uploader :thumb_box, Magensinus::ThumbUploader
    # Document
    mount_uploader :document_box, Magensinus::DocumentUploader

    # Clean capitions
    # ---------------
    # Thumb
    after_save(-> { clean_caption(thumb_box, :thumb_caption) })
    # Document caption
    after_save(-> { clean_caption(document_box, :document_caption) })
  end
end
