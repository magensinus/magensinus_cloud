# frozen_string_literal: true

module Journal
  module AssetHelper
    include ApplicationHelper

    # Journal asset form url
    def journal_asset_form_url
      if params_new || params_create
        journal_article_assets_path
      else
        journal_article_asset_path
      end
    end
  end
end
