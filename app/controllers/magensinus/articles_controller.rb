# frozen_string_literal: true

module Magensinus
  class ArticlesController < ApplicationController
    # Callbacks
    # ---------
    # Magensinus articles
    before_action :magensinus_articles, only: [:show, :edit, :update]

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
      if @magensinus_articles.update(magensinus_articles_params)
        flash[:notice] = "Successfully updated..."
        redirect_to magensinus_articles_path
      else
        render :edit
      end
    end

    private

    # Magensinus articles
    def magensinus_articles
      @magensinus_articles = Magensinus::Articles.first!
    end

    # Whitelist params
    def magensinus_articles_params
      params.require(:magensinus_articles).permit(
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
