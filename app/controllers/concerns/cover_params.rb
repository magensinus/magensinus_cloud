# frozen_string_literal: true

module CoverParams
  extend ActiveSupport::Concern
  included do
    def cover_params
      [
        :cover,
        :cover_box,
        :remove_cover_box,
        :cover_box_cache,
        :cover_eml,
        :cover_box_eml,
        :remove_cover_box_eml,
        :cover_box_eml_cache,
        :cover_magestil,
        :cover_box_magestil,
        :remove_cover_box_magestil,
        :cover_box_magestil_cache,
        :cover_magensinus,
        :cover_box_magensinus,
        :remove_cover_box_magensinus,
        :cover_box_magensinus_cache,
        :cover_caption
      ]
    end
  end
end
