# frozen_string_literal: true

module Magensinus
  class Courses < ApplicationRecord
    # Table name
    self.table_name = 'magensinus_courses'

    # Concerns
    include Slug
  end
end
