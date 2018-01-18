# frozen_string_literal: true

module Magensinus
  class AboutController < ApplicationController
    before_action :set_magensinus_about, only: [:show, :edit, :update, :destroy]

    # GET /magensinus_about/1
    def show
    end

    # GET /magensinus_about/1/edit
    def edit
    end

    # PATCH/PUT /magensinus_about/1
    def update
      if @magensinus_about.update(magensinus_about_params)
        redirect_to magensinus_about_path, notice: 'Magensinus about was successfully updated.'
      else
        render :edit
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_magensinus_about
      @magensinus_about = Magensinus::About.first!
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def magensinus_about_params
      params.require(:magensinus_about).permit(
        :slug,
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
