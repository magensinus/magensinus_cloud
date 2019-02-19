# frozen_string_literal: true

module IconParams
  extend ActiveSupport::Concern
  included do
    def icon_params
      [
        :icon,
        :icon_box,
        :remove_icon_box,
        :icon_box_cache,
        :icon_eml,
        :icon_box_eml,
        :remove_icon_box_eml,
        :icon_box_eml_cache,
        :icon_magestil,
        :icon_box_magestil,
        :remove_icon_box_magestil,
        :icon_box_magestil_cache,
        :icon_magensinus,
        :icon_box_magensinus,
        :remove_icon_box_magensinus,
        :icon_box_magensinus_cache,
        :icon_caption
      ]
    end
  end
end
