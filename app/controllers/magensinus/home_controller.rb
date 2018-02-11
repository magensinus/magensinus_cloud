# frozen_string_literal: true

module Magensinus
  class HomeController < ApplicationController
    # Callbacks
    # ---------
    # Magensinus home
    before_action :magensinus_home, only: [:show, :edit, :update]

    # GET /magensinus/home
    def show
    end

    # GET /magensinus/home/edit
    def edit
    end

    # PATCH/PUT /magensinus/home
    def update
      if @magensinus_home.update(magensinus_home_params)
        flash[:notice] = "Successfully updated..."
        redirect_to magensinus_home_path
      else
        render :edit
      end
    end

    private

    # Magensinus home
    def magensinus_home
      @magensinus_home = Magensinus::Home.first!
    end

    # Whitelist parameters
    def magensinus_home_params
      params.require(:magensinus_home).permit(
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
