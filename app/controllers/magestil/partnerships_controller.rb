# frozen_string_literal: true

module Magestil
  class PartnershipsController < ApplicationController
    # Callbacks
    # ---------
    # Magestil partnerships
    before_action :magestil_partnerships, only: [:show, :edit, :update]

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

    # Whitelist params
    def magestil_partnerships_params
      params.require(:magestil_partnerships).permit(
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
