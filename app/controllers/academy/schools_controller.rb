# frozen_string_literal: true

module Academy
  class SchoolsController < ApplicationController
    # Params
    # ------
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
    # Academy school
    before_action :academy_school, only: [:show, :edit, :update, :destroy]

    # Index
    # -----
    def index
      @academy_schools = Academy::School.all
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
      if @academy_school.update(academy_school_params)
        flash[:notice] = "Successfully updated..."
        redirect_to academy_school_path(@academy_school)
      else
        render :edit
      end
    end

    # Destroy
    # -------
    def destroy
      @academy_school.destroy
      flash[:notice] = "Successfully destroyed..."
      redirect_to academy_schools_path
    end

    # New
    # ---
    def new
      @academy_school = Academy::School.new
    end

    # Create
    # ------
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

    # Whitelist params
    def academy_school_params
      params.require(:academy_school).permit(
        thumb_params,
        cover_params,
        image_params,
        document_params,
        # Meta tags
        :meta_title,
        :meta_description,
        :meta_image_box,
        :meta_url,
        # Misc
        :title,
        :description,
        :url,
        :published,
        :position,
        # Schools
        :eml,
        :magestil,
        :magensinus
      )
    end
  end
end
