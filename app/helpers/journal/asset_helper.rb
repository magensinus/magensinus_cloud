# frozen_string_literal: true

module Journal
  module AssetHelper
    def asset_form_url(parent, child)
      if params[:action] == "new" || params[:action] == "create"
        journal_article_assets_path
      else
        journal_article_asset_path(parent, child)
      end
    end
  end
end
