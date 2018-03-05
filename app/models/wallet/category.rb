# frozen_string_literal: true

module Wallet
  class Category < ApplicationRecord
    # Table name
    self.table_name = "wallet_categories"

    # Concerns
    include Slug
    # include CleanCaption
    include SortablePosition

    # Uploaders
    mount_uploader :thumb_box, Wallet::ThumbUploader
    mount_uploader :thumb_box_eml, Wallet::ThumbUploader
    mount_uploader :thumb_box_magestil, Wallet::ThumbUploader
    mount_uploader :thumb_box_magensinus, Wallet::ThumbUploader

    mount_uploader :cover_box, Wallet::CoverUploader
    mount_uploader :cover_box_eml, Wallet::CoverUploader
    mount_uploader :cover_box_magestil, Wallet::CoverUploader
    mount_uploader :cover_box_magensinus, Wallet::CoverUploader

    # Clean Capitions
    # after_save(-> { clean_caption(thumb_box, :thumb_caption) })
    # after_save(-> { clean_caption(cover_box, :cover_caption) })

    # Relationships
    has_many :assets, dependent: :destroy, foreign_key: "wallet_category_id", inverse_of: false
    accepts_nested_attributes_for :assets
  end
end
