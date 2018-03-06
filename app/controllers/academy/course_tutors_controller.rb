# frozen_string_literal: true

module Academy
  class CourseTutorsController < ApplicationController
    # Callbacks
    # ---------
    # Academy course
    before_action :academy_course
    # Academy course tutor
    before_action :academy_course_tutor, only: [:edit, :update, :destroy]

    # Index
    # -----
    def index
      @academy_course_tutors ||= @academy_course.course_tutors.includes(:course).includes(:tutor).all
    end

    # Edit
    # ----
    def edit
    end

    # Update
    # ------
    def update
      if @academy_course_tutor.update(academy_course_tutor_params)
        redirect_to academy_course_course_tutors_path(@academy_course)
      else
        render :edit
      end
    end

    # Destroy
    # -------
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

    # Whitelist params
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
