# frozen_string_literal: true

module Magestil
  class SettingsController < ApplicationController
    # Callbacks
    # ---------
    # Magensinus settings
    before_action :magestil_settings, only: [:show, :edit, :update]

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
      if @magestil_settings.update(magestil_settings_params)
        flash[:notice] = "Successfully updated..."
        redirect_to magestil_settings_path
      else
        render :edit
      end
    end

    private

    # Magestil settings
    def magestil_settings
      @magestil_settings = Magensinus::Settings.first!
    end

    # Whitelist params
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
