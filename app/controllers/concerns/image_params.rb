# frozen_string_literal: true

module ImageParams
  extend ActiveSupport::Concern
  included do
    def image_params
      [
        :image,
        :image_box,
        :remove_image_box,
        :image_box_cache,
        :image_eml,
        :image_box_eml,
        :remove_image_box_eml,
        :image_box_eml_cache,
        :image_magestil,
        :image_box_magestil,
        :remove_image_box_magestil,
        :image_box_magestil_cache,
        :image_magensinus,
        :image_box_magensinus,
        :remove_image_box_magensinus,
        :image_box_magensinus_cache,
        :image_caption
      ]
    end
  end
end
