# frozen_string_literal: true

module Magensinus
  class NewsletterController < ApplicationController
    # Callbacks
    # ---------
    # Magensinus newsletter
    before_action :magensinus_newsletter, only: [:show, :edit, :update]

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
      if @magensinus_newsletter.update(magensinus_newsletter_params)
        flash[:notice] = "Successfully updated..."
        redirect_to magensinus_newsletter_path
      else
        render :edit
      end
    end

    private

    # Magensinus newsletter
    def magensinus_newsletter
      @magensinus_newsletter = Magensinus::Newsletter.first!
    end

    # Whitelist params
    def magensinus_newsletter_params
      params.require(:magensinus_newsletter).permit(
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
