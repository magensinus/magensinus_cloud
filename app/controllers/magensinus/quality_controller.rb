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
        :meta_title,
        :meta_description,
        :meta_image_box,
        :meta_url,
        :title,
        :description,
        :body,
        :image,
        :image_box,
        :image_caption,
        :remove_image_box,
        :image_box_cache
      )
    end
  end
end
