# frozen_string_literal: true

module Magensinus
  class CoursesController < ApplicationController
    # Callbacks
    # ---------
    # Magensinus courses
    before_action :magensinus_courses, only: [:show, :edit, :update]

    # Show
    # ----
    # GET /magensinus/courses
    def show
    end

    # Edit
    # ----
    # GET /magensinus/courses/edit
    def edit
    end

    # Update
    # ------
    # PATCH/PUT /magensinus/courses
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

    # Whitelist parameters
    def magensinus_courses_params
      params.require(:magensinus_courses).permit(
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
