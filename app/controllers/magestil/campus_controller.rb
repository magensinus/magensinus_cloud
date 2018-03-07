# frozen_string_literal: true

module Magestil
  class CampusController < ApplicationController
    # Callbacks
    # ---------
    # Magestil campus
    before_action :magestil_campus, only: [:show, :edit, :update]

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
      if @magestil_campus.update(magestil_campus_params)
        flash[:notice] = "Successfully updated..."
        redirect_to magestil_campus_path
      else
        render :edit
      end
    end

    private

    # Magestil campus
    def magestil_campus
      @magestil_campus = Magestil::Campus.first!
    end

    # Whitelist params
    def magestil_campus_params
      params.require(:magestil_campus).permit(
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
