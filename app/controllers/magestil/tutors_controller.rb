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
