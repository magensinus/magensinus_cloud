# frozen_string_literal: true

module Magensinus
  class AboutAssetUploader < ::ImageUploader
    # Original
    process resize_to_limit: [1920, 1920]

    # Versions
    # --------
    # Nano
    version :thumb do
      # process resize_to_fill: [480, 270, gravity = "Center"]
      process resize_to_fill: [512, 512, "Center"]
    end

    # Prefix variable
    def prefix
      "about-asset-image-"
    end

    # Override the filename of the uploaded files:
    def filename
      "#{prefix}#{model.slug}-#{Time.zone.today}.#{file.extension}" if original_filename.present?
    end
  end
end
