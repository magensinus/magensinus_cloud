# frozen_string_literal: true

module Magensinus
  class HomeController < ApplicationController
    # Callbacks
    # ---------
    # Magensinus home
    before_action :magensinus_home, only: [:show, :edit, :update]

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
      if @magensinus_home.update(magensinus_home_params)
        flash[:notice] = "Successfully updated..."
        redirect_to magensinus_home_path
      else
        render :edit
      end
    end

    private

    # Magensinus home
    def magensinus_home
      @magensinus_home = Magensinus::Home.first!
    end

    # Whitelist params
    def magensinus_home_params
      params.require(:magensinus_home).permit(
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
