# frozen_string_literal: true

module Magensinus
  class NewsletterController < ApplicationController
    before_action :set_magensinus_newsletter, only: [:show, :edit, :update]

    # GET /magensinus_newsletter/1
    def show
    end

    # GET /magensinus_newsletter/1/edit
    def edit
    end

    # PATCH/PUT /magensinus_newsletter/1
    def update
      if @magensinus_newsletter.update(magensinus_newsletter_params)
        redirect_to magensinus_newsletter_path, notice: "Magensinus newsletter was successfully updated."
      else
        render :edit
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_magensinus_newsletter
      @magensinus_newsletter = Magensinus::Newsletter.first!
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def magensinus_newsletter_params
      params.require(:magensinus_newsletter).permit(
        :meta_title,
        :meta_description,
        :meta_image_box,
        :meta_url,
        :title,
        :description,
        :body,
        :success,
        :failure
      )
    end
  end
end
