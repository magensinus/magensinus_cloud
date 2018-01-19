# frozen_string_literal: true

module Wallet
  class Category < ApplicationRecord
    # Table name
    self.table_name = "wallet_categories"
    self.table_name_prefix = "wallet_"

    # Concerns
    include Slug

    # Relationships
    # has_many :assets, dependent: :destroy, foreign_key: "wallet_category_id"
    # accepts_nested_attributes_for :assets, allow_destroy: true
  end
end
