# frozen_string_literal: true

module Magensinus
  class SchoolsController < ApplicationController
    # Callbacks
    # ---------
    # Magensinus schools
    before_action :magensinus_schools, only: [:show, :edit, :update]

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

    # Whitelist params
    def magensinus_schools_params
      params.require(:magensinus_schools).permit(
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
