# frozen_string_literal: true

module Wallet
  module AssetHelper
    include ApplicationHelper

    def wallet_asset_form_url(parent, child)
      if params_new || params_create
        wallet_category_assets_path
      else
        wallet_category_asset_path(parent, child)
      end
    end
  end
end
