# frozen_string_literal: true

module Academy
  class Course < ApplicationRecord
    # Table name
    self.table_name = "academy_courses"

    # Concerns
    include Slug
    include ScopeLists
    include CleanCaption
    include SortablePosition

    # Uploaders
    mount_uploader :thumb_box, Academy::ThumbUploader
    mount_uploader :cover_box, Academy::CoverUploader

    # Clean Capitions
    after_save(-> { clean_caption(thumb_box, :thumb_caption) })
    after_save(-> { clean_caption(cover_box, :cover_caption) })
  end
end
