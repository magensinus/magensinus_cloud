# frozen_string_literal: true

module Magensinus
  class QualityController < ApplicationController
    before_action :set_magensinus_quality, only: [:show, :edit, :update, :destroy]

    # GET /magensinus_quality/1
    def show
    end

    # GET /magensinus_quality/1/edit
    def edit
    end

    # PATCH/PUT /magensinus_quality/1
    def update
      if @magensinus_quality.update(magensinus_quality_params)
        redirect_to magensinus_quality_path, notice: 'Magensinus quality was successfully updated.'
      else
        render :edit
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_magensinus_quality
      @magensinus_quality = Magensinus::Quality.first!
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def magensinus_quality_params
      params.require(:magensinus_quality).permit(
        :slug,
        :meta_title,
        :meta_description,
        :meta_image_box,
        :meta_url,
        :title,
        :description,
        :body
      )
    end
  end
end
