# frozen_string_literal: true

module Magensinus
  module SettingsHelper
    # Fetch settings
    def fetch_settings
      @fetch_settings ||= Magensinus::Settings.first!
    end
  end
end
