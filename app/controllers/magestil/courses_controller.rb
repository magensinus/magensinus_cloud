# frozen_string_literal: true

module Magestil
  class CoursesController < ApplicationController
    # Callbacks
    # ---------
    # Magestil courses
    before_action :magestil_courses, only: [:show, :edit, :update]

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
      if @magestil_courses.update(magestil_courses_params)
        flash[:notice] = "Successfully updated..."
        redirect_to magestil_courses_path
      else
        render :edit
      end
    end

    private

    # Magestil courses
    def magestil_courses
      @magestil_courses = Magestil::Courses.first!
    end

    # Whitelist params
    def magestil_courses_params
      params.require(:magestil_courses).permit(
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
