# frozen_string_literal: true

module Magestil
  class CampusAsset < ApplicationRecord
    # Table name
    # ----------
    # Magestil campus_asset
    self.table_name = "magestil_campus_assets"

    # Concerns
    # --------
    # Slug
    include Slug
    # Clean caption
    include CleanCaption

    # Uploaders
    # ---------
    # Image
    mount_uploader :image_box, Magensinus::ThumbUploader

    # Clean capitions
    # ---------------
    # Image
    after_save(-> { clean_caption(image_box, :image_caption) })
  end
end
