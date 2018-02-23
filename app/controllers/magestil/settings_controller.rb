# frozen_string_literal: true

module Magestil
  class SettingsController < ApplicationController
    # Callbacks
    # ---------
    # Magensinus settings
    before_action :magestil_settings, only: [:show, :edit, :update]

    # Show
    # ----
    # GET /magestil/settings
    def show
    end

    # Edit
    # ----
    # GET /magestil/settings/edit
    def edit
    end

    # Update
    # ------
    # PATCH/PUT /magestil/settings
    def update
      if @magestil_settings.update(magestil_settings_params)
        flash[:notice] = "Successfully updated..."
        redirect_to magestil_settings_path
      else
        render :edit
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def magestil_settings
      @magestil_settings = Magensinus::Settings.first!
    end

    # Whitelist parameters
    def magestil_settings_params
      params.require(:magestil_settings).permit(
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
