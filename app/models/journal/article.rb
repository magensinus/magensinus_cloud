# frozen_string_literal: true

module Journal
  class Article < ApplicationRecord
    # Table name
    self.table_name = "journal_articles"

    # Concerns
    include Slug
    include ScopeLists
    include CleanCaption

    # Relationships
    has_many :assets, dependent: :destroy, foreign_key: "journal_article_id", inverse_of: false
    accepts_nested_attributes_for :assets

    # Uploaders
    mount_uploader :thumb_box, Journal::ThumbUploader
    mount_uploader :cover_box, Journal::CoverUploader

    # Clean Capitions
    after_save(-> { clean_caption(thumb_box, :thumb_caption) })
    after_save(-> { clean_caption(cover_box, :cover_caption) })
  end
end
