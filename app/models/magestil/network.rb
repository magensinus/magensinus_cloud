# frozen_string_literal: true

module Magestil
  class Network < ApplicationRecord
    # Table name
    self.table_name = "magestil_networks"

    # Concerns
    include Slug
    include CleanCaption

    # Uploaders
    mount_uploader :thumb_box, Magestil::ThumbUploader

    # Clean Capitions
    after_save(-> { clean_caption(thumb_box, :thumb_caption) })
  end
end
