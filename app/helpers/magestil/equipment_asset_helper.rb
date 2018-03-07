# frozen_string_literal: true

module Magestil
  module EquipmentAssetHelper
    # Magestil equipment asset form url
    def magestil_equipment_asset_form_url
      if params_new || params_create
        magestil_equipment_assets_path
      else
        magestil_equipment_asset_path
      end
    end
  end
end
