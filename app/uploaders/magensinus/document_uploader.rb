# frozen_string_literal: true

module Magensinus
  class DocumentUploader < ::DocumentUploader
    # Prefix variable
    def prefix
      "magensinus-document-"
    end

    # Override the filename of the uploaded files:
    def filename
      "#{prefix}#{model.slug}-#{Time.zone.today}.#{file.extension}" if original_filename.present?
    end
  end
end
