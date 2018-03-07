# frozen_string_literal: true

module Wallet
  class Category < ApplicationRecord
    # Table name
    # ----------
    # Wallet categories
    self.table_name = "wallet_categories"

    # Concerns
    # --------
    # Slug
    include Slug
    # Clean caption
    # include CleanCaption
    # Sortable positions
    include SortablePosition

    # Uploaders
    # ---------
    # Thumb
    mount_uploader :thumb_box, Wallet::ThumbUploader
    mount_uploader :thumb_box_eml, Wallet::ThumbUploader
    mount_uploader :thumb_box_magestil, Wallet::ThumbUploader
    mount_uploader :thumb_box_magensinus, Wallet::ThumbUploader
    # Cover
    mount_uploader :cover_box, Wallet::CoverUploader
    mount_uploader :cover_box_eml, Wallet::CoverUploader
    mount_uploader :cover_box_magestil, Wallet::CoverUploader
    mount_uploader :cover_box_magensinus, Wallet::CoverUploader
    # Image
    mount_uploader :image_box, Wallet::CoverUploader
    mount_uploader :image_box_eml, Wallet::CoverUploader
    mount_uploader :image_box_magestil, Wallet::CoverUploader
    mount_uploader :image_box_magensinus, Wallet::CoverUploader
    # Document
    mount_uploader :document_box, Wallet::DocumentUploader
    mount_uploader :document_box_eml, Wallet::DocumentUploader
    mount_uploader :document_box_magestil, Wallet::DocumentUploader
    mount_uploader :document_box_magensinus, Wallet::DocumentUploader

    # Relationships
    has_many :assets, dependent: :destroy, foreign_key: "wallet_category_id", inverse_of: false
    accepts_nested_attributes_for :assets
  end
end
