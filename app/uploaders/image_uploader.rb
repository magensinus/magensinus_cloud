# frozen_string_literal: true

class ImageUploader < ::ApplicationUploader
  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   "/images/fallback/" + [version_name, "cover-default.png"].compact.join("_")
  # end

  # Original
  process resize_to_limit: [1920, 1920]

  # Versions
  # --------
  # Nano
  version :nano do
    process resize_to_limit: [120, 1920]
  end

  # Tiny
  version :tiny do
    process resize_to_limit: [240, 1920]
  end

  # Small
  version :small do
    process resize_to_limit: [480, 1920]
  end

  # Medium
  version :medium do
    process resize_to_limit: [720, 1920]
  end

  # large
  version :large do
    process resize_to_limit: [960, 1920]
  end

  # Extension whitelist
  def extension_whitelist
    %w[gif png jpg jpeg]
  end
end
