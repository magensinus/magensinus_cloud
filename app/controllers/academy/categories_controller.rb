# frozen_string_literal: true

module Academy
  class CategoriesController < ApplicationController
    before_action :set_academy_category, only: [:show, :edit, :update, :destroy]

    # GET /academy_categories
    def index
      @academy_categories = Academy::Category.all
    end

    # GET /academy_categories/1
    def show
    end

    # GET /academy_categories/new
    def new
      @academy_category = Academy::Category.new
    end

    # GET /academy_categories/1/edit
    def edit
    end

    # POST /academy_categories
    def create
      order = Academy::Category.pluck(:position).compact
      @academy_category = Academy::Category.new(academy_category_params)
      order << 0
      @academy_category.position = (order.min - 1)

      if @academy_category.save
        redirect_to @academy_category, notice: 'Academy category was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /academy_categories/1
    def update
      if @academy_category.update(academy_category_params)
        redirect_to @academy_category, notice: 'Academy category was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /academy_categories/1
    def destroy
      @academy_category.destroy
      redirect_to academy_categories_url, notice: 'Academy category was successfully destroyed.'
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
