# frozen_string_literal: true

module Journal
  module AssetHelper
    include ApplicationHelper

    def journal_asset_form_url(parent, child)
      if params_new || params_create
        journal_article_assets_path
      else
        journal_article_asset_path(parent, child)
      end
    end
  end
end
