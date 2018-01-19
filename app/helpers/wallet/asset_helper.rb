# frozen_string_literal: true

module Wallet
  module AssetHelper
    def wallet_asset_form_url(parent, child)
      if params[:action] == "new" || params[:action] == "create"
        wallet_category_assets_path
      else
        wallet_category_asset_path(parent, child)
      end
    end
  end
end
