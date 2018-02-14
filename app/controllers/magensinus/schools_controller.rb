# frozen_string_literal: true

module Magensinus
  class SchoolsController < ApplicationController
    # Callbacks
    # ---------
    # Magensinus schools
    before_action :magensinus_schools, only: [:show, :edit, :update]

    # Show
    # ----
    # GET /magensinus/schools
    def show
    end

    # Edit
    # ----
    # GET /magensinus/schools/edit
    def edit
    end

    # Update
    # ------
    # PATCH/PUT /magensinus/schools
    def update
      if @magensinus_schools.update(magensinus_schools_params)
        flash[:notice] = "Successfully updated..."
        redirect_to magensinus_schools_path
      else
        render :edit
      end
    end

    private

    # Magensinus schools
    def magensinus_schools
      @magensinus_schools = Magensinus::Schools.first
    end

    # Whitelist parameters
    def magensinus_schools_params
      params.require(:magensinus_schools).permit(
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
