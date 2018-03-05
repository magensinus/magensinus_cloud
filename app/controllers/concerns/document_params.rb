# frozen_string_literal: true

module DocumentParams
  extend ActiveSupport::Concern
  included do
    def document_params
      document_params = [
        :document,
        :document_box,
        :remove_document_box,
        :document_box_cache,
        :document_eml,
        :document_box_eml,
        :remove_document_box_eml,
        :document_box_eml_cache,
        :document_magestil,
        :document_box_magestil,
        :remove_document_box_magestil,
        :document_box_magestil_cache,
        :document_magensinus,
        :document_box_magensinus,
        :remove_document_box_magensinus,
        :document_box_magensinus_cache,
        :document_caption
      ]
    end
  end
end
