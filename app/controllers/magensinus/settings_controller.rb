# frozen_string_literal: true

module Magensinus
  class SettingsController < ApplicationController
    before_action :set_magensinus_setting, only: [:show, :edit, :update]

    # GET /magensinus_settings/1
    def show
    end

    # GET /magensinus_settings/1/edit
    def edit
    end

    # PATCH/PUT /magensinus_settings/1
    def update
      if @magensinus_settings.update(magensinus_settings_params)
        redirect_to magensinus_settings_path, notice: 'Magensinus settings was successfully updated.'
      else
        render :edit
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_magensinus_setting
      @magensinus_settings = Magensinus::Settings.first!
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def magensinus_settings_params
      params.require(:magensinus_settings).permit(
        :slug,
        :meta_title,
        :meta_description,
        :meta_image_box,
        :meta_url,
        :title,
        :description,
        :url
      )
    end
  end
end
