# frozen_string_literal: true

module Academy
  class CoursesController < ApplicationController
    before_action :set_academy_course, only: [:show, :edit, :update, :destroy]

    # GET /academy_courses
    def index
      @academy_courses = Academy::Course.all
    end

    # GET /academy_courses/1
    def show
    end

    # GET /academy_courses/new
    def new
      @academy_course = Academy::Course.new
    end

    # GET /academy_courses/1/edit
    def edit
    end

    # POST /academy_courses
    def create
      order = Academy::Course.pluck(:position).compact
      @academy_course = Academy::Course.new(academy_course_params)
      order << 0
      @academy_course.position = (order.min - 1)

      if @academy_course.save
        redirect_to @academy_course, notice: "Academy course was successfully created."
      else
        render :new
      end
    end

    # PATCH/PUT /academy_courses/1
    def update
      if @academy_course.update(academy_course_params)
        redirect_to @academy_course, notice: "Academy course was successfully updated."
      else
        render :edit
      end
    end

    # DELETE /academy_courses/1
    # DELETE /academy_courses/1.json
    def destroy
      @academy_course.destroy
      redirect_to academy_courses_url, notice: "Academy course was successfully destroyed."
    end

    def sortable
      Academy::Course.sort_position(params[:academy_course])
      head :ok
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_academy_course
      @academy_course = Academy::Course.find_by(slug: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def academy_course_params
      params.require(:academy_course).permit(
        :meta_title,
        :meta_description,
        :meta_image_box,
        :meta_url,
        :title,
        :description,
        :thumb,
        :thumb_box,
        :thumb_caption,
        :remove_thumb_box,
        :cover,
        :cover_box,
        :cover_caption,
        :remove_cover_box,
        :draft,
        :published_at,
        :eml,
        :magestil,
        :magensinus,
        :position
      )
    end
  end
end
