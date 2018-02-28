# frozen_string_literal: true

module Magestil
  class PartnershipsController < ApplicationController
    # Callbacks
    # ---------
    # Magestil partnerships
    before_action :magestil_partnerships, only: [:show, :edit, :update]

    # Show
    # ----
    # GET /magestil/partnerships
    def show
    end

    # Edit
    # ----
    # GET /magestil/partnerships/edit
    def edit
    end

    # Update
    # ------
    # PATCH/PUT /magestil/partnerships
    def update
      if @magestil_partnerships.update(magestil_partnerships_params)
        flash[:notice] = "Successfully updated..."
        redirect_to magestil_partnerships_path
      else
        render :edit
      end
    end

    private

    # Magestil partnerships
    def magestil_partnerships
      @magestil_partnerships = Magestil::Partnerships.first!
    end

    # Whitelist parameters
    def magestil_partnerships_params
      params.require(:magestil_partnerships).permit(
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
