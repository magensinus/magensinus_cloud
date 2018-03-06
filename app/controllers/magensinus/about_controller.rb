# frozen_string_literal: true

module Magensinus
  class AboutController < ApplicationController
    # Callbacks
    # ---------
    # Magensinus about
    before_action :magensinus_about, only: [:show, :edit, :update]

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
      if @magensinus_about.update(magensinus_about_params)
        flash[:notice] = "Successfully updated..."
        redirect_to magensinus_about_path
      else
        render :edit
      end
    end

    private

    # Magensinus about
    def magensinus_about
      @magensinus_about = Magensinus::About.first!
    end

    # Whitelist params
    def magensinus_about_params
      params.require(:magensinus_about).permit(
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
