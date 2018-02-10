# frozen_string_literal: true

module Magensinus
  class CoursesController < ApplicationController
    before_action :set_magensinus_courses, only: [:show, :edit, :update]

    # GET /magensinus_courses/1
    def show
    end

    # GET /magensinus_courses/1/edit
    def edit
    end

    # PATCH/PUT /magensinus_courses/1
    def update
      if @magensinus_courses.update(magensinus_courses_params)
        flash[:notice] = "Successfully updated..."
        redirect_to magensinus_courses_path
      else
        render :edit
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_magensinus_courses
      @magensinus_courses = Magensinus::Courses.first!
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def magensinus_courses_params
      params.require(:magensinus_courses).permit(
        :meta_title,
        :meta_description,
        :meta_image_box,
        :meta_url,
        :title,
        :description,
        :body
      )
    end
  end
end
