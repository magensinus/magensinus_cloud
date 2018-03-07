# frozen_string_literal: true

module Magestil
  module CampusAssetHelper
    # Magestil campus asset form url
    def magestil_campus_asset_form_url
      if params_new || params_create
        magestil_campus_assets_path
      else
        magestil_campus_asset_path
      end
    end
  end
end
