# frozen_string_literal: true

module Magensinus
  class QualityController < ApplicationController
    # Callbacks
    # ---------
    # Magensinus quality
    before_action :magensinus_quality, only: [:show, :edit, :update]

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
      if @magensinus_quality.update(magensinus_quality_params)
        flash[:notice] = "Successfully updated..."
        redirect_to magensinus_quality_path
      else
        render :edit
      end
    end

    private

    # Magensinus quality
    def magensinus_quality
      @magensinus_quality = Magensinus::Quality.first!
    end

    # Whitelist params
    def magensinus_quality_params
      params.require(:magensinus_quality).permit(
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
