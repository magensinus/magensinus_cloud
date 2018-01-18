# frozen_string_literal: true

module Magensinus
  class HomeController < ApplicationController
    before_action :set_magensinus_home, only: [:show, :edit, :update]

    # GET /magensinus_home/1
    def show
    end

    # GET /magensinus_home/1/edit
    def edit
    end

    # PATCH/PUT /magensinus_home/1
    def update
      if @magensinus_home.update(magensinus_home_params)
        redirect_to magensinus_home_path, notice: 'Magensinus home was successfully updated.'
      else
        render :edit
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_magensinus_home
      @magensinus_home = Magensinus::Home.first!
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def magensinus_home_params
      params.require(:magensinus_home).permit(
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
