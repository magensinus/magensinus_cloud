# frozen_string_literal: true

module Endorsement
  class Badge < ApplicationRecord
    # Table name
    self.table_name = "endorsement_badges"

    # Concerns
    include Slug
    include ScopeLists
    include CleanCaption

    # Uploaders
    mount_uploader :thumb_box, Endorsement::ThumbUploader

    # Clean Capitions
    after_save(-> { clean_caption(thumb_box, :thumb_caption) })
  end
end
