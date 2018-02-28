# frozen_string_literal: true

module Magestil
  class CampusController < ApplicationController
    # Callbacks
    # ---------
    # Magestil campus
    before_action :magestil_campus, only: [:show, :edit, :update]

    # Show
    # ----
    # GET /magestil/campus
    def show
    end

    # Edit
    # ----
    # GET /magestil/campus/edit
    def edit
    end

    # Update
    # ------
    # PATCH/PUT /magestil/campus
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

    # Whitelist parameters
    def magestil_campus_params
      params.require(:magestil_campus).permit(
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
