# frozen_string_literal: true

module Academy
  class CategoriesController < ApplicationController
    before_action :set_academy_category, only: [:show, :edit, :update, :destroy]

    # GET /academy/categories
    def index
      @academy_categories ||= Academy::Category.all
    end

    # GET /academy/categories/AXuyFD1I
    def show
    end

    # GET /academy/categories/AXuyFD1I/edit
    def edit
    end

    # PATCH/PUT /academy/categories/AXuyFD1I
    def update
      if @academy_category.update(academy_category_params)
        flash[:notice] = "Successfully updated..."
        redirect_to academy_category_path(@academy_category)
      else
        render :edit
      end
    end

    # DELETE /academy/categories/AXuyFD1I
    def destroy
      @academy_category.destroy
      flash[:notice] = "Successfully destroyed..."
      redirect_to academy_categories_path
    end

    # GET /academy/categories/new
    def new
      @academy_category = Academy::Category.new
    end

    # POST /academy/categories
    def create
      order = Academy::Category.pluck(:position).compact
      @academy_category = Academy::Category.new(academy_category_params)
      order << 0
      @academy_category.position = (order.min - 1)

      if @academy_category.save
        flash[:notice] = "Successfully created..."
        redirect_to academy_category_path(@academy_category)
      else
        render :new
      end
    end

    # PATCH /academy/categories
    def sortable
      Academy::Category.sort_position(params[:academy_category])
      head :ok
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_academy_category
      @academy_category = Academy::Category.find_by(slug: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def academy_category_params
      params.require(:academy_category).permit(
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
        :published,
        :eml,
        :magestil,
        :magensinus,
        :position
      )
    end
  end
end
