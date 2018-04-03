# frozen_string_literal: true

module Academy
  class CoursesController < ApplicationController
    # Params
    # ------
    # Theme
    include ThemeParams
    # Thumb
    include ThumbParams
    # Cover
    include CoverParams
    # Image
    include ImageParams
    # Document
    include DocumentParams

    # Callbacks
    # ---------
    # Academy categories
    before_action :academy_categories, only: [:new, :create, :edit, :update]
    # Academy course
    before_action :academy_course, only: [:show, :edit, :update, :destroy]

    # Index
    # -----
    def index
      @academy_courses             = Academy::Course.all_by_group.includes(:category)
      @scheduled_academy_courses   = Academy::Course.scheduled.includes(:category)
      @published_academy_courses   = Academy::Course.published.includes(:category)
      @unpublished_academy_courses = Academy::Course.unpublished.includes(:category)
    end

    # Show
    # ----
    def show
      @academy_tutors = @academy_course.course_tutors.includes(:tutor).all
    end

    # Edit
    # ----
    def edit
      @academy_tutors = Academy::Tutor.all
    end

    # Update
    # ------
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
    def destroy
      @academy_course.destroy
      flash[:notice] = "Successfully destroyed..."
      redirect_to academy_courses_path
    end

    # New
    # ---
    def new
      @academy_tutors = Academy::Tutor.all
      @academy_course = Academy::Course.new
    end

    # Create
    # ------
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

    # Whitelist params
    def academy_course_params
      params.require(:academy_course).permit(
        theme_params,
        thumb_params,
        cover_params,
        image_params,
        document_params,
        # relationships
        :academy_category_id,
        # Meta tags
        :meta_title,
        :meta_description,
        :meta_image_box,
        :meta_url,
        # Misc
        :title,
        :description,
        :body,
        :misc,
        :published,
        :published_at,
        :position,
        # External
        :external,
        :url,
        # Schools
        :eml,
        :magestil,
        :magensinus,
        # Collections
        tutor_ids: []
      )
    end
  end
end
