# frozen_string_literal: true

module Academy
  class CoursesController < ApplicationController
    before_action :set_academy_categories,  only: [:new, :create, :edit, :update]
    before_action :set_academy_course,      only: [:show, :edit, :update, :destroy]

    # GET /academy/courses
    def index
      @draft_academy_courses      ||= Academy::Course.draft.order(academy_category_id: :asc)
      @scheduled_academy_courses  ||= Academy::Course.scheduled.order(academy_category_id: :asc)
      @published_academy_courses  ||= Academy::Course.published.order(academy_category_id: :asc)
    end

    # GET /academy/courses/BCjsHY4R
    def show
    end

    # GET /academy/courses/BCjsHY4R/edit
    def edit
    end

    # PATCH/PUT /academy/courses/BCjsHY4R
    def update
      if @academy_course.update(academy_course_params)
        flash[:notice] = "Successfully updated..."
        redirect_to academy_course_path(@academy_course)
      else
        render :edit
      end
    end

    # DELETE /academy/courses/BCjsHY4R
    def destroy
      @academy_course.destroy
      flash[:notice] = "Successfully destroyed..."
      redirect_to academy_courses_path
    end

    # GET /academy/courses/new
    def new
      @academy_course = Academy::Course.new
    end

    # POST /academy/courses
    def create
      order = Academy::Course.pluck(:position).compact
      @academy_course = Academy::Course.new(academy_course_params)
      order << 0
      @academy_course.position = (order.min - 1)

      if @academy_course.save
        flash[:notice] = "Successfully created..."
        redirect_to academy_course_path(@academy_course)
      else
        render :new
      end
    end

    # PATCH /academy/courses
    def sortable
      Academy::Course.sort_position(params[:academy_course])
      head :ok
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_academy_categories
      @academy_categories ||= Academy::Category.all
    end

    def set_academy_course
      @academy_course ||= Academy::Course.find_by(slug: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def academy_course_params
      params.require(:academy_course).permit(
        :academy_category_id,
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
