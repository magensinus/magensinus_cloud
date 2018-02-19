# frozen_string_literal: true

module Magestil
  class About < ApplicationRecord
    # Table name
    self.table_name = "magestil_about"

    # Concerns
    # --------
    # Slug
    include Slug
    # Clean caption
    include CleanCaption

    # Uploaders
    # ---------
    # Image
    mount_uploader :image_box, Magestil::ImageUploader

    # Clean Capitions
    # ---------------
    # Image caption
    after_save(-> { clean_caption(image_box, :image_caption) })
  end
end