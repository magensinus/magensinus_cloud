# frozen_string_literal: true

module Magensinus
  class Network < ApplicationRecord
    # Table name
    # ----------
    # Magensinus networks
    self.table_name = "magensinus_networks"

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
    # Thumb
    mount_uploader :thumb_box, Magensinus::ThumbUploader
    # Document
    # mount_uploader :document_box, Magensinus::DocumentUploader

    # Clean capitions
    # ---------------
    # Thumb
    after_save(-> { clean_caption(thumb_box, :thumb_caption) })
    # Document caption
    # after_save(-> { clean_caption(document_box, :document_caption) })
  end
end
