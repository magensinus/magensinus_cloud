# frozen_string_literal: true

module Wallet
  class Asset < ApplicationRecord
    # Table name
    self.table_name = "wallet_assets"

    # Concerns
    include Slug
    include CleanCaption
    include SortablePosition

    # Uploaders
    mount_uploader :document_box, Wallet::DocumentUploader

    # Clean Capitions
    after_save(-> { clean_caption(document_box, :document_caption) })

    # Relationships
    belongs_to :category, foreign_key: "wallet_category_id", inverse_of: false
  end
end
