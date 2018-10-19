# frozen_string_literal: true

module Legal
  class Article < ApplicationRecord
    # Table name
    # ----------
    # Journal articles
    self.table_name = "legal_articles"

    # Concerns
    # --------
    # Slug
    include Slug
    # Scope lists
    include ScopeLists

    # Uploaders
    # ---------
    # Thumb
    mount_uploader :thumb_box, Journal::ThumbUploader
    mount_uploader :thumb_box_eml, Journal::ThumbUploader
    mount_uploader :thumb_box_magestil, Journal::ThumbUploader
    mount_uploader :thumb_box_magensinus, Journal::ThumbUploader
    # Cover
    mount_uploader :cover_box, Journal::CoverUploader
    mount_uploader :cover_box_eml, Journal::CoverUploader
    mount_uploader :cover_box_magestil, Journal::CoverUploader
    mount_uploader :cover_box_magensinus, Journal::CoverUploader
    # Image
    mount_uploader :image_box, Journal::CoverUploader
    mount_uploader :image_box_eml, Journal::CoverUploader
    mount_uploader :image_box_magestil, Journal::CoverUploader
    mount_uploader :image_box_magensinus, Journal::CoverUploader
    # Document
    mount_uploader :document_box, Journal::DocumentUploader
    mount_uploader :document_box_eml, Journal::DocumentUploader
    mount_uploader :document_box_magestil, Journal::DocumentUploader
    mount_uploader :document_box_magensinus, Journal::DocumentUploader

    # Relationships
    # -------------
    # Assets
    has_many :assets, dependent: :destroy, foreign_key: "legal_article_id", inverse_of: false
    accepts_nested_attributes_for :assets
  end
end
