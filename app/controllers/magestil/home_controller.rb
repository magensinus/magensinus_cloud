# frozen_string_literal: true

module Magestil
  class HomeController < ApplicationController
    # Callbacks
    # ---------
    # Magestil home
    before_action :magestil_home, only: [:show, :edit, :update]

    # GET /magestil/home
    def show
    end

    # GET /magestil/home/edit
    def edit
    end

    # PATCH/PUT /magestil/home
    def update
      if @magestil_home.update(magestil_home_params)
        flash[:notice] = "Successfully updated..."
        redirect_to magestil_home_path
      else
        render :edit
      end
    end

    private

    # Magestil home
    def magestil_home
      @magestil_home = Magestil::Home.first!
    end

    # Whitelist parameters
    def magestil_home_params
      params.require(:magestil_home).permit(
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
