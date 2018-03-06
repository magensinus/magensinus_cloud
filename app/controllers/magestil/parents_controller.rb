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
