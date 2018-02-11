# frozen_string_literal: true

module Magensinus
  class QualityController < ApplicationController
    # Callbacks
    # ---------
    # Magensinus quality
    before_action :magensinus_quality, only: [:show, :edit, :update]

    # Show
    # ----
    # GET /magensinus/quality
    def show
    end

    # Edit
    # ----
    # GET /magensinus/quality/edit
    def edit
    end

    # Update
    # ------
    # PATCH/PUT /magensinus/quality
    def update
      if @magensinus_quality.update(magensinus_quality_params)
        flash[:notice] = "Successfully updated..."
        redirect_to magensinus_quality_path
      else
        render :edit
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def magensinus_quality
      @magensinus_quality = Magensinus::Quality.first!
    end

    # Whitelist parameters
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
