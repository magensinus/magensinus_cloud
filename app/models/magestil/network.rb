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
    # Sortable position
    include SortablePosition

    # Uploaders
    # ---------
    # Thumb
    mount_uploader :thumb_box, Magensinus::ThumbUploader

    # Clean capitions
    # ---------------
    # Thumb
    after_save(-> { clean_caption(thumb_box, :thumb_caption) })
  end
end
