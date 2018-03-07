# frozen_string_literal: true

class DocumentUploader < ::ApplicationUploader
  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   "/images/fallback/" + [version_name, "document-default.png"].compact.join("_")
  # end

  # Extension whitelist
  def extension_whitelist
    %w[pdf]
  end
end
