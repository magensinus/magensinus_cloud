# frozen_string_literal: true

module Wallet
  module AssetHelper
    include ApplicationHelper

    # Wallet asset form url
    def wallet_asset_form_url
      if params_new || params_create
        wallet_category_assets_path
      else
        wallet_category_asset_path
      end
    end
  end
end
