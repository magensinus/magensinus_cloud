# frozen_string_literal: true

module Partnerships
  class ImageUploader < ::ImageUploader
    # Prefix variable
    def prefix
      "partnerships-image-"
    end

    # Override the filename of the uploaded files:
    def filename
      "#{prefix}#{model.slug}-#{Time.zone.today}.#{file.extension}" if original_filename.present?
    end
  end
end
