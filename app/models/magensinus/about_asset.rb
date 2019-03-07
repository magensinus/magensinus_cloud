# frozen_string_literal: true

module Magensinus
  class AboutAsset < ApplicationRecord
    # Table name
    # ----------
    # Magensinus about_asset
    self.table_name = "magensinus_about_assets"

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
    mount_uploader :image_box, Magensinus::AboutAssetUploader

    # Clean capitions
    # ---------------
    # Image
    after_save(-> { clean_caption(image_box, :image_caption) })
  end
end
