# frozen_string_literal: true

module Subscriptions
  class Email < ApplicationRecord
    # Table name
    self.table_name = "subscriptions_emails"

    # Concerns
    include Slug
  end
end
