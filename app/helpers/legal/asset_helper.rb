# frozen_string_literal: true

module Legal
  module AssetHelper
    # Journal asset form url
    def legal_asset_form_url
      if params_new || params_create
        legal_article_assets_path
      else
        legal_article_asset_path
      end
    end
  end
end
