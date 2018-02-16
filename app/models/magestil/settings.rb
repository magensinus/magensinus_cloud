# frozen_string_literal: true

module Magestil
  class Settings < ApplicationRecord
    # Table name
    self.table_name = "magestil_settings"

    # Concerns
    include Slug
  end
end
