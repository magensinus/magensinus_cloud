# frozen_string_literal: true

module Magensinus
  class Articles < ApplicationRecord
    # Table name
    self.table_name = "magensinus_articles"

    # Concerns
    # --------
    # Slug
    include Slug
    # Clean caption
    include CleanCaption

    # Uploaders
    # ---------
    # Image
    mount_uploader :image_box, Magensinus::ImageUploader

    # Clean Capitions
    # ---------------
    # Image caption
    after_save(-> { clean_caption(image_box, :image_caption) })
  end
end
