# frozen_string_literal: true

module Legal
  class CoverUploader < ::CoverUploader
    # Prefix variable
    def prefix
      "legal-cover-"
    end

    # Override the filename of the uploaded files:
    def filename
      "#{prefix}#{model.slug}-#{Time.zone.today}.#{file.extension}" if original_filename.present?
    end
  end
end
