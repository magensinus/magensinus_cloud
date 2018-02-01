# frozen_string_literal: true

module Journal
  class Asset < ApplicationRecord
    # Table name
    self.table_name = "journal_assets"

    # Concerns
    include Slug
    include CleanVideo
    include CleanCaption
    include SortablePosition

    # Relationships
    belongs_to :article, foreign_key: "journal_article_id", inverse_of: false

    # Uploaders
    mount_uploader :image_box, Journal::ImageUploader

    # Clean Capitions
    after_save(-> { clean_caption(image_box, :image_caption) })
  end
end
