# frozen_string_literal: true

module Magensinus
  class Contact < ApplicationRecord
    # Table name
    self.table_name = 'magensinus_contact'

    # Concerns
    include Slug
  end
end
