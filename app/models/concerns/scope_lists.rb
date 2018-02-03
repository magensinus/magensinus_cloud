# frozen_string_literal: true

module ScopeLists
  extend ActiveSupport::Concern
  included do
    # Scoping
    scope :draft, -> { where(draft: true) }
    scope :scheduled, -> { where(draft: false).where("published_at > ?", Time.zone.now) }
    scope :published, -> { where(draft: false).where("published_at <= ?", Time.zone.now) }
  end
end
