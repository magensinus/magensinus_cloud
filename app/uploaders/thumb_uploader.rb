# frozen_string_literal: true

class ThumbUploader < ::ApplicationUploader
  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   "/images/fallback/" + [version_name, "thumb-default.png"].compact.join("_")
  # end

  # Original
  process resize_to_limit: [720, 720]

  # Versions
  # --------
  # Nano
  version :nano do
    process resize_to_limit: [40, 720]
  end

  # Tiny
  version :tiny do
    process resize_to_limit: [80, 720]
  end

  # Small
  version :small do
    process resize_to_limit: [120, 720]
  end

  # Medium
  version :medium do
    process resize_to_limit: [240, 720]
  end

  # large
  version :large do
    process resize_to_limit: [480, 720]
  end

  # Extension whitelist
  def extension_whitelist
    %w[gif png jpg jpeg]
  end
end
