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
      @magestil_settings = Magestil::Settings.first!
    end

    # Whitelist params
    def magestil_settings_params
      params.require(:magestil_settings).permit(
        # Meta tags
        :meta_title,
        :meta_description,
        :meta_image_box,
        :meta_url,
        # Misc
        :title,
        :description,
        :url,
        :enrollment_success,
        :enrollment_failure,
        :enrollment_description,
        :newsletter_success,
        :newsletter_failure,
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
