# frozen_string_literal: true

module ScopeLists
  extend ActiveSupport::Concern
  included do
    # Scope lists
    scope :scheduled,   -> { where(published: true).where("published_at > ?", Time.zone.now) }
    scope :published,   -> { where(published: true).where("published_at <= ?", Time.zone.now) }
    scope :unpublished, -> { where(published: false) }
  end
end
