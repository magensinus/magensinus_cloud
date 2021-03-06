# frozen_string_literal: true

module Academy
  class IconUploader < ::IconUploader
    # Prefix variable
    def prefix
      "academy-icon-"
    end

    # Override the filename of the uploaded files:
    def filename
      "#{prefix}#{model.slug}-#{Time.zone.today}.#{file.extension}" if original_filename.present?
    end
  end
end
