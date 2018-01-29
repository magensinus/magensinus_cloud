# frozen_string_literal: true

module Magensinus
  class Quality < ApplicationRecord
    # Table name
    self.table_name = "magensinus_quality"

    # Concerns
    include Slug
  end
end
