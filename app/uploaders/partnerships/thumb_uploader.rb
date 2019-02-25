# frozen_string_literal: true

module Partnerships
  class ThumbUploader < ::ThumbUploader
    # Versions
    # --------
    # Nano
    version :thumb do
      # process resize_to_fill: [480, 270, gravity = "Center"]
      process resize_to_fill: [512, 512, gravity = "Center"]
    end

    # Prefix variable
    def prefix
      "partnerships-thumb-"
    end

    # Override the filename of the uploaded files:
    def filename
      "#{prefix}#{model.slug}-#{Time.zone.today}.#{file.extension}" if original_filename.present?
    end
  end
end
