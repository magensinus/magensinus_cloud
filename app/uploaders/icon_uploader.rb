# frozen_string_literal: true

class IconUploader < ::ApplicationUploader
  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   "/images/fallback/" + [version_name, "icon-default.png"].compact.join("_")
  # end

  # Original
  process resize_to_limit: [512, 512]

  # Versions
  # --------
  # Nano
  version :nano do
    process resize_to_limit: [48, 48]
  end

  # Tiny
  version :tiny do
    process resize_to_limit: [96, 96]
  end

  # Small
  version :small do
    process resize_to_limit: [128, 128]
  end

  # Medium
  version :medium do
    process resize_to_limit: [256, 256]
  end

  # large
  version :large do
    process resize_to_limit: [512, 512]
  end

  # Extension whitelist
  def extension_whitelist
    %w[gif png jpg jpeg]
  end
end
