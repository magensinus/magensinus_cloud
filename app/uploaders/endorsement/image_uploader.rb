# frozen_string_literal: true

module Endorsement
  class ImageUploader < ::ImageUploader
    # Prefix variable
    def prefix
      "endorsement-image-"
    end

    # Override the filename of the uploaded files:
    def filename
      "#{prefix}#{model.slug}-#{Time.zone.today}.#{file.extension}" if original_filename.present?
    end
  end
end
