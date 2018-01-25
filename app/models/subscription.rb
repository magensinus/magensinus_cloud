# frozen_string_literal: true

class Subscription < ApplicationRecord
  # Table name
  self.table_name = "subscriptions"

  # Concerns
  # -----------------------------------------------------------------
  # Slug
  include Slug

  # Validations
  # -----------------------------------------------------------------
  # Email
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :active, acceptance: true
end
