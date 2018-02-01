# frozen_string_literal: true

module Wallet
  class Category < ApplicationRecord
    # Table name
    self.table_name = "wallet_categories"

    # Concerns
    include Slug

    # Relationships
    has_many :assets, dependent: :destroy, foreign_key: "wallet_category_id", inverse_of: false
    accepts_nested_attributes_for :assets, allow_destroy: true
  end
end
