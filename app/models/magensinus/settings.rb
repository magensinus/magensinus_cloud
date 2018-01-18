# frozen_string_literal: true

module Magensinus
  class Settings < ApplicationRecord
    # Table name
    self.table_name = 'magensinus_settings'

    # Concerns
    include Slug
  end
end
