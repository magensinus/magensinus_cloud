# frozen_string_literal: true

module ThemeParams
  extend ActiveSupport::Concern
  included do
    def theme_params
      [
        :gradient_color_one,
        :gradient_color_two,
        :gradient_color_fallback,
        :font_color_one,
        :font_color_two,
        :hover_color_one,
        :hover_color_two,
        :background_color_one,
        :background_color_two
      ]
    end
  end
end
