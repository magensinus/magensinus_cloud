# frozen_string_literal: true

module Academy
  class School < ApplicationRecord
    # Table name
    # ----------
    # Academy Schools
    self.table_name = "academy_schools"

    # Concerns
    # --------
    # Slug
    include Slug
    # Clean caption
    # include CleanCaption
    # Sortable position
    include SortablePosition

    # Uploaders
    # ---------
    # Thumb
    mount_uploader :thumb_box, Academy::ThumbUploader
    mount_uploader :thumb_box_eml, Academy::ThumbUploader
    mount_uploader :thumb_box_magestil, Academy::ThumbUploader
    mount_uploader :thumb_box_magensinus, Academy::ThumbUploader
    # Cover
    mount_uploader :cover_box, Academy::CoverUploader
    mount_uploader :cover_box_eml, Academy::CoverUploader
    mount_uploader :cover_box_magestil, Academy::CoverUploader
    mount_uploader :cover_box_magensinus, Academy::CoverUploader

    # Clean Capitions
    # ---------------
    # Thumb
    # after_save(-> { clean_caption(thumb_box, :thumb_caption) })
    # Cover
    # after_save(-> { clean_caption(cover_box, :cover_caption) })
  end
end
