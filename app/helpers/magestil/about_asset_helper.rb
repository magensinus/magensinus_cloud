# frozen_string_literal: true

module Magestil
  module AboutAssetHelper
    # Magestil about asset form url
    def magestil_about_asset_form_url
      if params_new || params_create
        magestil_about_assets_path
      else
        magestil_about_asset_path
      end
    end
  end
end
