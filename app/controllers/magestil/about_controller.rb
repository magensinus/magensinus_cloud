# frozen_string_literal: true

module Magestil
  class AboutController < ApplicationController
    # Callbacks
    # ---------
    # Magestil about
    before_action :magestil_about, only: [:show, :edit, :update]

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
      if @magestil_about.update(magestil_about_params)
        flash[:notice] = "Successfully updated..."
        redirect_to magestil_about_path
      else
        render :edit
      end
    end

    private

    # Magestil about
    def magestil_about
      @magestil_about = Magestil::About.first!
    end

    # Whitelist params
    def magestil_about_params
      params.require(:magestil_about).permit(
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
