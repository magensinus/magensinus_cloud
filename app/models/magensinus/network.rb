# frozen_string_literal: true

module Magensinus
  class Network < ApplicationRecord
    # Table name
    self.table_name = "magensinus_networks"

    # Concerns
    include Slug
    include CleanCaption

    # Uploaders
    mount_uploader :thumb_box, Magensinus::ThumbUploader

    # Clean Capitions
    after_save(-> { clean_caption(thumb_box, :thumb_caption) })
  end
end
