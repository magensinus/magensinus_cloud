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
