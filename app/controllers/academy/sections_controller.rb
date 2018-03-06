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
    def index
      @academy_sections = @academy_course.sections.all
    end

    # Show
    # ----
    def show
    end

    # Edit
    # ----
    def edit
    end

    # Update
    # ------
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
    def destroy
      @academy_section.destroy
      flash[:notice] = "Successfully destroyed..."
      redirect_to academy_course_sections_path(@academy_course)
    end

    # New
    # ---
    def new
      @academy_section = @academy_course.sections.new
    end

    # Create
    # ------
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

    # Whitelist params
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
