# frozen_string_literal: true

module Magensinus
  class Home < ApplicationRecord
    # Table name
    self.table_name = 'magensinus_home'

    # Concerns
    include Slug
  end
end
