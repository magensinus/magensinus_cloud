# frozen_string_literal: true

class Subscription < ApplicationRecord
  # Table name
  self.table_name = "subscriptions"

  # Concerns
  include Slug
end
