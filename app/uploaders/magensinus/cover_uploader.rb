# frozen_string_literal: true

module Magensinus
  class CoverUploader < ::CoverUploader
    # Prefix variable
    def prefix
      "magensinus-cover-"
    end

    # Override the filename of the uploaded files:
    def filename
      "#{prefix}#{model.slug}-#{Time.zone.today}.#{file.extension}" if original_filename.present?
    end
  end
end
