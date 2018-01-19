# frozen_string_literal: true

module Journal
  class Asset < ApplicationRecord
    # Table name
    self.table_name = "journal_assets"

    # Concerns
    include Slug
    include CleanVideo
    include SortablePosition

    # Relationships
    belongs_to :article, foreign_key: "journal_article_id"
  end
end
