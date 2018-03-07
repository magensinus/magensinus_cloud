# frozen_string_literal: true

module Magestil
  class TutorsController < ApplicationController
    # Callbacks
    # ---------
    # Magestil tutors
    before_action :magestil_tutors, only: [:show, :edit, :update]

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
      if @magestil_tutors.update(magestil_tutors_params)
        flash[:notice] = "Successfully updated..."
        redirect_to magestil_tutors_path
      else
        render :edit
      end
    end

    private

    # Magestil tutors
    def magestil_tutors
      @magestil_tutors = Magestil::Tutors.first!
    end

    # Whitelist params
    def magestil_tutors_params
      params.require(:magestil_tutors).permit(
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
