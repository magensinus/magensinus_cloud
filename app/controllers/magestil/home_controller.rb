# frozen_string_literal: true

module Magestil
  class HomeController < ApplicationController
    # Callbacks
    # ---------
    # Magestil home
    before_action :magestil_home, only: [:show, :edit, :update]

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
      if @magestil_home.update(magestil_home_params)
        flash[:notice] = "Successfully updated..."
        redirect_to magestil_home_path
      else
        render :edit
      end
    end

    private

    # Magestil home
    def magestil_home
      @magestil_home = Magestil::Home.first!
    end

    # Whitelist params
    def magestil_home_params
      params.require(:magestil_home).permit(
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
