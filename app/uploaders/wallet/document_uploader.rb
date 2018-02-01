# frozen_string_literal: true

module Wallet
  class DocumentUploader < ApplicationUploader
    # Provide a default URL as a default if there hasn't been a file uploaded:
    def default_url
      "/images/fallback/" + [version_name, "wallet-document-default.png"].compact.join("_")
    end

    # Prefix variable
    def prefix
      "wallet-document-"
    end

    def extension_whitelist
      %w[pdf]
    end
  end
end
