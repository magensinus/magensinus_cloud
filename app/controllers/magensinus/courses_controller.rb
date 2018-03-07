# frozen_string_literal: true

module Magensinus
  class CoursesController < ApplicationController
    # Callbacks
    # ---------
    # Magensinus courses
    before_action :magensinus_courses, only: [:show, :edit, :update]

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
      if @magensinus_courses.update(magensinus_courses_params)
        flash[:notice] = "Successfully updated..."
        redirect_to magensinus_courses_path
      else
        render :edit
      end
    end

    private

    # Magensinus courses
    def magensinus_courses
      @magensinus_courses = Magensinus::Courses.first!
    end

    # Whitelist params
    def magensinus_courses_params
      params.require(:magensinus_courses).permit(
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
