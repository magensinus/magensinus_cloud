# frozen_string_literal: true

module Academy
  class SchoolsController < ApplicationController
    before_action :academy_school, only: [:show, :edit, :update, :destroy]

    # GET /academy/schools
    def index
      @academy_schools = Academy::School.all
    end

    # GET /academy/schools/jk89Re87
    def show
    end

    # GET /academy/schools/jk89Re87/edit
    def edit
    end

    # PATCH/PUT /academy/schools/jk89Re87
    def update
      if @academy_school.update(academy_school_params)
        flash[:notice] = "Successfully updated..."
        redirect_to academy_school_path(@academy_school)
      else
        render :edit
      end
    end

    # DELETE /academy/schools/jk89Re87
    def destroy
      @academy_school.destroy
      flash[:notice] = "Successfully destroyed..."
      redirect_to academy_schools_path
    end

    # GET /academy/schools/new
    def new
      @academy_school = Academy::School.new
    end

    # POST /academy/schools
    def create
      @academy_school = Academy::School.new(academy_school_params)

      if @academy_school.save
        flash[:notice] = "Successfully created..."
        redirect_to academy_school_path(@academy_school)
      else
        render :new
      end
    end

    private

    # Academy school
    def academy_school
      @academy_school = Academy::School.find_by(slug: params[:id])
    end

    # Whitelist parameters
    def academy_school_params
      params.require(:academy_school).permit(
        :meta_title,
        :meta_description,
        :meta_image_box,
        :meta_url,
        :title,
        :description,
        :url,
        :thumb,
        :thumb_box,
        :thumb_caption,
        :remove_thumb_box,
        :thumb_box_cache,
        :cover,
        :cover_box,
        :cover_caption,
        :remove_cover_box,
        :cover_box_cache,
        :published,
        :position,
        :eml,
        :magestil,
        :magensinus
      )
    end
  end
end
