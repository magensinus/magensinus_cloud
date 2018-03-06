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
    def index
      @academy_section_assets = @academy_section.section_assets.includes(:section).all
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
      if @academy_section_asset.update(academy_section_asset_params)
        redirect_to academy_course_section_section_assets_path(@academy_course, @academy_section)
      else
        render :edit
      end
    end

    # Destroy
    # -------
    def destroy
      @academy_section_asset.destroy
      redirect_to academy_course_section_section_assets_path(@academy_course, @academy_section)
    end

    # New
    # ---
    def new
      @academy_section_asset = @academy_section.section_assets.new
    end

    # Create
    # ------
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

    # Whitelist params
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
