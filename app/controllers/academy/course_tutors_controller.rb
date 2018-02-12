# frozen_string_literal: true

module Academy
  class CourseTutorsController < ApplicationController
    before_action :academy_course
    before_action :academy_course_tutor, only: [:edit, :update, :destroy]

    # GET /academy_course_tutors
    def index
      @academy_course_tutors = @academy_course.course_tutors.all
    end

    # GET /academy_course_tutors/1/edit
    def edit
    end

    # PATCH/PUT /academy_course_tutors/1
    def update
      if @academy_course_tutor.update(academy_course_tutor_params)
        redirect_to academy_course_course_tutors_path(@academy_course)
      else
        render :edit
      end
    end

    # DELETE /academy_course_tutors/1
    def destroy
      @academy_course_tutor.destroy
      redirect_to academy_course_course_tutors_path(@academy_course)
    end

    private

    # Academy course
    def academy_course
      @academy_course = Academy::Course.find_by(slug: params[:course_id])
    end

    # Academy course tutor
    def academy_course_tutor
      @academy_course_tutor = @academy_course.course_tutors.find_by(slug: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def academy_course_tutor_params
      params.require(:academy_course_tutor).permit(
        :academy_course_id,
        :academy_tutor_id,
        :coordinator,
        :position
      )
    end
  end
end
