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
