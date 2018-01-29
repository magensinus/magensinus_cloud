# frozen_string_literal: true

module Magensinus
  class Articles < ApplicationRecord
    # Table name
    self.table_name = "magensinus_articles"

    # Concerns
    include Slug
  end
end
