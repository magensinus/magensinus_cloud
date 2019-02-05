# frozen_string_literal: true

module VideoParams
  extend ActiveSupport::Concern
  included do
    def video_params
      [
        :video,
        :video_box,
        :video_caption,
        :video_service,
        :video_eml,
        :video_box_eml,
        :video_caption_eml,
        :video_service_eml,
        :video_magestil,
        :video_box_magestil,
        :video_caption_magestil,
        :video_service_magestil,
        :video_magensinus,
        :video_box_magensinus,
        :video_caption_magensinus,
        :video_service_magensinus
      ]
    end
  end
end
