# frozen_string_literal: true

module Academy
  class SectionAssetsController < ApplicationController
    # Callbacks
    # ---------
    # Academy course
    before_action :academy_course
    # Academy section
    before_action :academy_section
    # Academy section asset
    before_action :academy_section_asset, only: [:show, :edit, :update, :destroy, :sortable]

    # Index
    # -----
    # GET /academy_section_assets
    def index
      @academy_section_assets = @academy_section.section_assets.includes(:section).all
    end

    # Show
    # ----
    # GET /academy_section_assets/1
    def show
    end

    # Edit
    # ----
    # GET /academy_section_assets/1/edit
    def edit
    end

    # Update
    # ------
    # PATCH/PUT /academy_section_assets/1
    def update
      if @academy_section_asset.update(academy_section_asset_params)
        redirect_to academy_course_section_section_assets_path(@academy_course, @academy_section)
      else
        render :edit
      end
    end

    # Destroy
    # -------
    # DELETE /academy_section_assets/1
    def destroy
      @academy_section_asset.destroy
      redirect_to academy_course_section_section_assets_path(@academy_course, @academy_section)
    end

    # New
    # ---
    # GET /academy_section_assets/new
    def new
      @academy_section_asset = @academy_section.section_assets.new
    end

    # Create
    # ------
    # POST /academy_section_assets
    def create
      assets = @academy_section.section_assets
      order = assets.pluck(:position).compact
      @academy_section_asset = assets.new(academy_section_asset_params)
      order << 0
      @academy_section_asset.position = (order.min - 1)

      if @academy_section_asset.save
        redirect_to academy_course_section_section_assets_path(@academy_course, @academy_section)
      else
        render :new
      end
    end

    # Sortable
    # --------
    # PATCH /academy/categories
    def sortable
      @academy_section.section_assets.sort_position(params[:academy_section_asset])
      head :ok
    end

    private

    # Academy course
    def academy_course
      @academy_course = Academy::Course.find_by(slug: params[:course_id])
    end

    # Academy section
    def academy_section
      @academy_section = @academy_course.sections.find_by(slug: params[:section_id])
    end

    # Academy section asset
    def academy_section_asset
      @academy_section_asset = @academy_section.section_assets.find_by(slug: params[:id])
    end

    # Whitelist parameters
    def academy_section_asset_params
      params.require(:academy_section_asset).permit(
        :academy_section_id,
        :text,
        :text_box,
        :image,
        :image_box,
        :image_caption,
        :document,
        :document_box,
        :document_caption,
        :video,
        :video_box,
        :video_caption,
        :video_service,
        :alignment,
        :position
      )
    end
  end
end
