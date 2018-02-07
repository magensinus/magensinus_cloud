# frozen_string_literal: true

module Academy
  class SectionAsset
    class ImageUploader < ApplicationUploader
      # Provide a default URL as a default if there hasn't been a file uploaded:
      def default_url
        "/images/fallback/" + [version_name, "section-asset-image-default.png"].compact.join("_")
      end

      # Prefix variable
      def prefix
        "section-asset-image-"
      end

      # Versions
      version :nano do
        process resize_to_fit: [8, 8]
      end

      version :tiny do
        process resize_to_fit: [32, 32]
      end

      version :small do
        process resize_to_fit: [64, 64]
      end

      version :medium do
        process resize_to_fit: [128, 128]
      end

      version :large do
        process resize_to_fit: [256, 256]
      end

      def extension_whitelist
        %w[gif png jpg jpeg]
      end
    end
  end
end
