# frozen_string_literal: true

module Magensinus
  class NewsletterController < ApplicationController
    # Callbacks
    # ---------
    # Magensinus newsletter
    before_action :magensinus_newsletter, only: [:show, :edit, :update]

    # Show
    # ----
    # GET /magensinus/newsletter
    def show
    end

    # Edit
    # ----
    # GET /magensinus/newsletter/edit
    def edit
    end

    # Update
    # ------
    # PATCH/PUT /magensinus/newsletter
    def update
      if @magensinus_newsletter.update(magensinus_newsletter_params)
        flash[:notice] = "Successfully updated..."
        redirect_to magensinus_newsletter_path
      else
        render :edit
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def magensinus_newsletter
      @magensinus_newsletter = Magensinus::Newsletter.first!
    end

    # Whitelist parameters
    def magensinus_newsletter_params
      params.require(:magensinus_newsletter).permit(
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
