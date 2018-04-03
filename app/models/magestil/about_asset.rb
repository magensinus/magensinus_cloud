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
    # Clean caption
    include CleanCaption

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
