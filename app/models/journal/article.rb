# frozen_string_literal: true

module Journal
  class Article < ApplicationRecord
    # Table name
    self.table_name = "journal_articles"

    # Concerns
    include Slug

    # Relationships
    has_many :assets, dependent: :destroy, foreign_key: "journal_article_id"
    accepts_nested_attributes_for :assets, allow_destroy: true
  end
end
