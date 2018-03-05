# frozen_string_literal: true

module ThumbParams
  extend ActiveSupport::Concern
  included do
    def thumb_params
      thumb_params = [
        :thumb,
        :thumb_box,
        :remove_thumb_box,
        :thumb_box_cache,
        :thumb_eml,
        :thumb_box_eml,
        :remove_thumb_box_eml,
        :thumb_box_eml_cache,
        :thumb_magestil,
        :thumb_box_magestil,
        :remove_thumb_box_magestil,
        :thumb_box_magestil_cache,
        :thumb_magensinus,
        :thumb_box_magensinus,
        :remove_thumb_box_magensinus,
        :thumb_box_magensinus_cache,
        :thumb_caption
      ]
    end
  end
end
