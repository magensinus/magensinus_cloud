# frozen_string_literal: true

module Academy
  class SectionAsset < ApplicationRecord
    # Table name
    # ----------
    # Academy section assets
    self.table_name = "academy_section_assets"

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
    mount_uploader :image_box, Academy::SectionAsset::ImageUploader
    # Document
    mount_uploader :document_box, Academy::SectionAsset::DocumentUploader

    # Clean Capitions
    # ---------------
    # Thumb
    after_save(-> { clean_caption(image_box, :image_caption) })
    # Document
    after_save(-> { clean_caption(document_box, :document_caption) })

    # Relationships
    # -------------
    # Academy section
    belongs_to :section, foreign_key: "academy_section_id", inverse_of: false
    accepts_nested_attributes_for :section
  end
end
