# frozen_string_literal: true

module Magestil
  class EquipmentAsset < ApplicationRecord
    # Table name
    # ----------
    # Magestil equipment_asset
    self.table_name = "magestil_equipment_assets"

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
    # Image
    mount_uploader :image_box, Magestil::EquipmentAssetUploader

    # Clean capitions
    # ---------------
    # Image
    after_save(-> { clean_caption(image_box, :image_caption) })
  end
end
