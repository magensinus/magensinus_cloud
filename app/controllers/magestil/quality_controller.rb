# frozen_string_literal: true

module Magestil
  class QualityController < ApplicationController
    # Callbacks
    # ---------
    # Magestil quality
    before_action :magestil_quality, only: [:show, :edit, :update]

    # Show
    # ----
    def show
    end

    # Edit
    # ----
    def edit
    end

    # Update
    # ------
    def update
      if @magestil_quality.update(magestil_quality_params)
        flash[:notice] = "Successfully updated..."
        redirect_to magestil_quality_path
      else
        render :edit
      end
    end

    private

    # Magestil quality
    def magestil_quality
      @magestil_quality = Magestil::Quality.first!
    end

    # Whitelist params
    def magestil_quality_params
      params.require(:magestil_quality).permit(
        # Meta tags
        :meta_title,
        :meta_description,
        :meta_image_box,
        :meta_url,
        # Misc
        :title,
        :description,
        :body,
        # Image
        :image,
        :image_box,
        :remove_image_box,
        :image_box_cache,
        :image_caption,
        # Document
        :document,
        :document_box,
        :remove_document_box,
        :document_box_cache,
        :document_caption
      )
    end
  end
end
