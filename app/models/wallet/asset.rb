# frozen_string_literal: true

module Wallet
  class Asset < ApplicationRecord
    # Table name
    # ----------
    # Wallet assets
    self.table_name = "wallet_assets"

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
    # Document
    mount_uploader :document_box, Wallet::DocumentUploader

    # Clean Capitions
    # ---------------
    # Document
    after_save(-> { clean_caption(document_box, :document_caption) })

    # Relationships
    # -------------
    # Category
    belongs_to :category, foreign_key: "wallet_category_id", inverse_of: false
    accepts_nested_attributes_for :category
  end
end
