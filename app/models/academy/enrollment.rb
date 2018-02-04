# frozen_string_literal: true

module Academy
  class Enrollment < ApplicationRecord
    # Table name
    self.table_name = "academy_enrollments"

    # Concerns
    include Slug

    # Relationships
    belongs_to :category, optional: true, foreign_key: "academy_category_id"
  end
end
