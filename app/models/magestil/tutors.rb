# frozen_string_literal: true

module Magestil
  class Tutors < ApplicationRecord
    # Table name
    self.table_name = "magestil_tutors"

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
