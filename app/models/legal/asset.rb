# frozen_string_literal: true

module Legal
  class Asset < ApplicationRecord
    # Table name
    # ----------
    # Journal assets
    self.table_name = "legal_assets"

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
    mount_uploader :image_box, Journal::ImageUploader
    # Document
    mount_uploader :document_box, Journal::DocumentUploader

    # Clean Capitions
    # ---------------
    # Image
    after_save(-> { clean_caption(image_box, :image_caption) })
    # Document
    after_save(-> { clean_caption(document_box, :document_caption) })

    # Relationships
    # -------------
    # Article
    belongs_to :article, foreign_key: "legal_article_id", inverse_of: false
    accepts_nested_attributes_for :article
  end
end
