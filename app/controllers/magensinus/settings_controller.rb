# frozen_string_literal: true

module Magensinus
  class SettingsController < ApplicationController
    # Callbacks
    # ---------
    # Magensinus settings
    before_action :magensinus_settings, only: [:show, :edit, :update]

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
      if @magensinus_settings.update(magensinus_settings_params)
        flash[:notice] = "Successfully updated..."
        redirect_to magensinus_settings_path
      else
        render :edit
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def magensinus_settings
      @magensinus_settings = Magensinus::Settings.first!
    end

    # Whitelist params
    def magensinus_settings_params
      params.require(:magensinus_settings).permit(
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
