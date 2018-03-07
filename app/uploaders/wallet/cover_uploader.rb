# frozen_string_literal: true

module Wallet
  class CoverUploader < ::CoverUploader
    # Prefix variable
    def prefix
      "wallet-cover-"
    end

    # Override the filename of the uploaded files:
    def filename
      "#{prefix}#{model.slug}-#{Time.zone.today}.#{file.extension}" if original_filename.present?
    end
  end
end
