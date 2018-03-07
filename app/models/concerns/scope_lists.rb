# frozen_string_literal: true

module ScopeLists
  extend ActiveSupport::Concern
  included do
    # Scope lists
    # -----------
    # Scheduled
    scope :scheduled,   -> { where(published: true).where("published_at > ?", Time.zone.now) }
    # Published
    scope :published,   -> { where(published: true).where("published_at <= ?", Time.zone.now) }
    # Unpublished
    scope :unpublished, -> { where(published: false) }
  end
end
