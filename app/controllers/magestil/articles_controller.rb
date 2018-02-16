# frozen_string_literal: true

module Magestil
  class ArticlesController < ApplicationController
    # Callbacks
    # ---------
    # Magestil articles
    before_action :magestil_articles, only: [:show, :edit, :update]

    # Show
    # ----
    # GET /magestil/articles
    def show
    end

    # Edit
    # ----
    # GET /magestil/articles/edit
    def edit
    end

    # Update
    # ------
    # PATCH/PUT /magestil/articles
    def update
      if @magestil_articles.update(magestil_articles_params)
        flash[:notice] = "Successfully updated..."
        redirect_to magestil_articles_path
      else
        render :edit
      end
    end

    private

    # Magestil articles
    def magestil_articles
      @magestil_articles = Magestil::Articles.first!
    end

    # Whitelist parameters
    def magestil_articles_params
      params.require(:magestil_articles).permit(
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
