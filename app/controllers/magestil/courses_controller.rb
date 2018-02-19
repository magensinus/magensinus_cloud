# frozen_string_literal: true

module Magestil
  class CoursesController < ApplicationController
    # Callbacks
    # ---------
    # Magestil courses
    before_action :magestil_courses, only: [:show, :edit, :update]

    # Show
    # ----
    # GET /magestil/courses
    def show
    end

    # Edit
    # ----
    # GET /magestil/courses/edit
    def edit
    end

    # Update
    # ------
    # PATCH/PUT /magestil/courses
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

    # Whitelist parameters
    def magestil_courses_params
      params.require(:magestil_courses).permit(
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