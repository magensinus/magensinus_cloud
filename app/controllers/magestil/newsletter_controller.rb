# frozen_string_literal: true

module Magestil
  class NewsletterController < ApplicationController
    # Callbacks
    # ---------
    # Magestil newsletter
    before_action :magestil_newsletter, only: [:show, :edit, :update]

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
      if @magestil_newsletter.update(magestil_newsletter_params)
        flash[:notice] = "Successfully updated..."
        redirect_to magestil_newsletter_path
      else
        render :edit
      end
    end

    private

    # Magestil newsletter
    def magestil_newsletter
      @magestil_newsletter = Magestil::Newsletter.first!
    end

    # Whitelist params
    def magestil_newsletter_params
      params.require(:magestil_newsletter).permit(
        :meta_title,
        :meta_description,
        :meta_image_box,
        :meta_url,
        :title,
        :description,
        :body,
        :success,
        :failure,
        :image,
        :image_box,
        :image_caption,
        :remove_image_box,
        :image_box_cache
      )
    end
  end
end
