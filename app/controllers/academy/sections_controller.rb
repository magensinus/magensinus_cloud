# frozen_string_literal: true

module Academy
  class SectionsController < ApplicationController
    # Callbacks
    # ---------
    # Academy course
    before_action :academy_course
    # Academy section
    before_action :academy_section, only: [:show, :edit, :update, :destroy]

    # Index
    # -----
    # GET /academy/courses/ghh78sd4Tg/sections
    def index
      @academy_sections = @academy_course.sections.all
    end

    # Show
    # ----
    # GET /academy/courses/ghh78sd4Tg/sections/hj62Ftg5jI
    def show
    end

    # Edit
    # ----
    # GET /academy/courses/ghh78sd4Tg/sections/hj62Ftg5jI/edit
    def edit
    end

    # Update
    # ------
    # PATCH/PUT /academy/courses/ghh78sd4Tg/sections/hj62Ftg5jI
    def update
      if @academy_section.update(academy_section_params)
        flash[:notice] = "Successfully updated..."
        redirect_to academy_course_section_path(@academy_course, @academy_section)
      else
        render :edit
      end
    end

    # Destroy
    # -------
    # DELETE /academy/courses/ghh78sd4Tg/sections/hj62Ftg5jI
    def destroy
      @academy_section.destroy
      flash[:notice] = "Successfully destroyed..."
      redirect_to academy_course_sections_path(@academy_course)
    end

    # New
    # ---
    # GET /academy/courses/ghh78sd4Tg/sections/new
    def new
      @academy_section = @academy_course.sections.new
    end

    # Create
    # ------
    # POST /academy/courses/ghh78sd4Tg/sections/
    def create
      @academy_section = @academy_course.sections.new(academy_section_params)
      if @academy_section.save
        flash[:notice] = "Successfully created..."
        redirect_to academy_course_section_path(@academy_course, @academy_section)
      else
        render :new
      end
    end

    private

    # Academy course
    def academy_course
      @academy_course = Academy::Course.find_by(slug: params[:course_id])
    end

    # Academy section
    def academy_section
      @academy_section = @academy_course.sections.find_by(slug: params[:id])
    end

    # Whitelist parameters
    def academy_section_params
      params.require(:academy_section).permit(
        :academy_course_id,
        :title,
        :published,
        :position
      )
    end
  end
end
