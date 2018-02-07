# frozen_string_literal: true

module Academy
  class SectionAsset
    class DocumentUploader < ApplicationUploader
      # Provide a default URL as a default if there hasn't been a file uploaded:
      def default_url
        "/images/fallback/" + [version_name, "section-asset-document-default.png"].compact.join("_")
      end

      # Prefix variable
      def prefix
        "section-asset-document-"
      end

      def extension_whitelist
        %w[pdf]
      end
    end
  end
end
