# frozen_string_literal: true

module Academy
  class CoursesController < ApplicationController
    # Callbacks
    # ---------
    # Academy categories
    before_action :academy_categories, only: [:new, :create, :edit, :update]
    # Academy course
    before_action :academy_course, only: [:show, :edit, :update, :destroy]

    # Index
    # -----
    # GET /academy/courses
    def index
      @academy_courses              ||= Academy::Course.all.includes(:category).order(academy_category_id: :asc)
      @scheduled_academy_courses    ||= Academy::Course.scheduled.includes(:category).order(academy_category_id: :asc)
      @published_academy_courses    ||= Academy::Course.published.includes(:category).order(academy_category_id: :asc)
      @unpublished_academy_courses  ||= Academy::Course.unpublished.includes(:category).order(academy_category_id: :asc)
    end

    # Show
    # ----
    # GET /academy/courses/BCjsHY4R
    def show
    end

    # Edit
    # ----
    # GET /academy/courses/BCjsHY4R/edit
    def edit
    end

    # Update
    # ------
    # PATCH/PUT /academy/courses/BCjsHY4R
    def update
      if @academy_course.update(academy_course_params)
        flash[:notice] = "Successfully updated..."
        redirect_to academy_course_path(@academy_course)
      else
        render :edit
      end
    end

    # Destroy
    # -------
    # DELETE /academy/courses/BCjsHY4R
    def destroy
      @academy_course.destroy
      flash[:notice] = "Successfully destroyed..."
      redirect_to academy_courses_path
    end

    # New
    # ---
    # GET /academy/courses/new
    def new
      @academy_course = Academy::Course.new
    end

    # Create
    # ------
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

    # Sortable
    # --------
    # PATCH /academy/courses
    def sortable
      Academy::Course.sort_position(params[:academy_course])
      head :ok
    end

    private

    # Academy categories
    def academy_categories
      @academy_categories ||= Academy::Category.all
    end

    # Academy course
    def academy_course
      @academy_course ||= Academy::Course.find_by(slug: params[:id])
    end

    # Whitelist parameters
    def academy_course_params
      params.require(:academy_course).permit(
        :academy_category_id,
        :meta_title,
        :meta_description,
        :meta_image_box,
        :meta_url,
        :title,
        :description,
        :body,
        :misc,
        :thumb,
        :thumb_box,
        :thumb_caption,
        :remove_thumb_box,
        :cover,
        :cover_box,
        :cover_caption,
        :remove_cover_box,
        :document,
        :document_box,
        :document_caption,
        :remove_document_box,
        :published,
        :published_at,
        :eml,
        :magestil,
        :magensinus,
        :position
      )
    end
  end
end
