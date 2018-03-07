# frozen_string_literal: true

module Magestil
  class ParentsController < ApplicationController
    # Callbacks
    # ---------
    # Magestil parents
    before_action :magestil_parents, only: [:show, :edit, :update]

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
      if @magestil_parents.update(magestil_parents_params)
        flash[:notice] = "Successfully updated..."
        redirect_to magestil_parents_path
      else
        render :edit
      end
    end

    private

    # Magestil parents
    def magestil_parents
      @magestil_parents = Magestil::Parents.first!
    end

    # Whitelist params
    def magestil_parents_params
      params.require(:magestil_parents).permit(
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
