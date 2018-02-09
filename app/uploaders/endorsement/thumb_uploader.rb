# frozen_string_literal: true

module Endorsement
  class ThumbUploader < ApplicationUploader
    # Provide a default URL as a default if there hasn't been a file uploaded:
    def default_url
      "/images/fallback/" + [version_name, "badge-thumb-default.png"].compact.join("_")
    end

    # Prefix variable
    def prefix
      "badge-thumb-"
    end

    # Versions
    version :nano do
      process resize_to_fill: [8, 8]
    end

    version :tiny do
      process resize_to_fill: [32, 32]
    end

    version :small do
      process resize_to_fill: [64, 64]
    end

    version :medium do
      process resize_to_fill: [128, 128]
    end

    version :large do
      process resize_to_fill: [256, 256]
    end

    def extension_whitelist
      %w[gif png jpg jpeg]
    end
  end
end
