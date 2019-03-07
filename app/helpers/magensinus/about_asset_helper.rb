# frozen_string_literal: true

module Magensinus
  module AboutAssetHelper
    # Magensinus about asset form url
    def magensinus_about_asset_form_url
      if params_new || params_create
        magensinus_about_assets_path
      else
        magensinus_about_asset_path
      end
    end
  end
end
