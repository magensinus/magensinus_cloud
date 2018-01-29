# frozen_string_literal: true

module Magensinus
  class ArticlesController < ApplicationController
    before_action :set_magensinus_articles, only: [:show, :edit, :update]

    # GET /magensinus_articles/1
    def show
    end

    # GET /magensinus_articles/1/edit
    def edit
    end

    # PATCH/PUT /magensinus_articles/1
    def update
      if @magensinus_articles.update(magensinus_articles_params)
        redirect_to magensinus_articles_path, notice: "Magensinus article was successfully updated."
      else
        render :edit
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_magensinus_articles
      @magensinus_articles = Magensinus::Articles.first!
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def magensinus_articles_params
      params.require(:magensinus_articles).permit(
        :meta_title,
        :meta_description,
        :meta_image_box,
        :meta_url,
        :title,
        :description,
        :body
      )
    end
  end
end
