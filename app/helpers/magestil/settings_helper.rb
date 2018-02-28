# frozen_string_literal: true

module Magestil
  module SettingsHelper
    # Fetch settings
    def fetch_settings
      @fetch_settings ||= Magestil::Settings.first!
    end
  end
end
