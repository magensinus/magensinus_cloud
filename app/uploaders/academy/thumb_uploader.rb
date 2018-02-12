# frozen_string_literal: true

module Academy
  class ThumbUploader < ApplicationUploader
    # Provide a default URL as a default if there hasn't been a file uploaded:
    def default_url
      "/images/fallback/" + [version_name, "academy-thumb-default.png"].compact.join("_")
    end

    # Prefix variable
    def prefix
      "academy-thumb-"
    end

    # Original
    process resize_to_limit: [720, 1024]

    # Versions
    # --------
    # Nano
    version :nano do
      process resize_to_limit: [40, 1024]
    end

    # Tiny
    version :tiny do
      process resize_to_limit: [80, 1024]
    end

    # Small
    version :small do
      process resize_to_limit: [120, 1024]
    end

    # Medium
    version :medium do
      process resize_to_limit: [240, 1024]
    end

    # large
    version :large do
      process resize_to_limit: [480, 1024]
    end

    # Extension whitelist
    def extension_whitelist
      %w[gif png jpg jpeg]
    end
  end
end
