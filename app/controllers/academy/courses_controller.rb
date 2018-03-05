# frozen_string_literal: true

module Academy
  class CoursesController < ApplicationController
    include ThumbParams
    include CoverParams
    include DocumentParams

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
      @academy_tutors = @academy_course.course_tutors.includes(:tutor).all
    end

    # Edit
    # ----
    # GET /academy/courses/BCjsHY4R/edit
    def edit
      @academy_tutors = Academy::Tutor.all
    end

    # Update
    # ------
    # PATCH/PUT /academy/courses/BCjsHY4R
    def update
      @academy_tutors = Academy::Tutor.all
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
      @academy_tutors = Academy::Tutor.all
      @academy_course = Academy::Course.new
    end

    # Create
    # ------
    # POST /academy/courses
    def create
      @academy_tutors = Academy::Tutor.all
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
        thumb_params,
        cover_params,
        document_params,
        :academy_category_id,
        :meta_title,
        :meta_description,
        :meta_image_box,
        :meta_url,
        :title,
        :description,
        :body,
        :misc,
        :published,
        :published_at,
        :eml,
        :magestil,
        :magensinus,
        :position,
        tutor_ids: []
      )
    end
  end
end
