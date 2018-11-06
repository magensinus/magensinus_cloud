# frozen_string_literal: true

module Magestil
  class AboutAsset < ApplicationRecord
    # Table name
    # ----------
    # Magestil about_asset
    self.table_name = "magestil_about_assets"

    # Concerns
    # --------
    # Slug
    include Slug
    # Clean video
    include CleanVideo
    # Clean caption
    include CleanCaption
    # Sortable position
    include SortablePosition

    # Uploaders
    # ---------
    # Image
    mount_uploader :image_box, Magestil::AboutAssetUploader

    # Clean capitions
    # ---------------
    # Image
    after_save(-> { clean_caption(image_box, :image_caption) })
  end
end
