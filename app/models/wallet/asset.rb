# frozen_string_literal: true

module Wallet
  class Asset < ApplicationRecord
    # Table name
    self.table_name = "wallet_assets"

    # Concerns
    include Slug
    include SortablePosition

    # Relationships
    belongs_to :category, foreign_key: "wallet_category_id"
  end
end
