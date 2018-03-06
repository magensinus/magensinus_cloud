# frozen_string_literal: true

module Academy
  class CategoriesController < ApplicationController
    # Params
    # ------
    # Image
    include ImageParams
    # Thumb
    include ThumbParams
    # Cover
    include CoverParams

    # Callbacks
    # ---------
    # Academy category
    before_action :academy_category, only: [:show, :edit, :update, :destroy]

    # Index
    # -----
    def index
      @academy_categories ||= Academy::Category.all
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
      if @academy_category.update(academy_category_params)
        flash[:notice] = "Successfully updated..."
        redirect_to academy_category_path(@academy_category)
      else
        render :edit
      end
    end

    # Destroy
    # -------
    def destroy
      @academy_category.destroy
      flash[:notice] = "Successfully destroyed..."
      redirect_to academy_categories_path
    end

    # New
    # ---
    def new
      @academy_category = Academy::Category.new
    end

    # Create
    # ------
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

    # Sortable
    # --------
    def sortable
      Academy::Category.sort_position(params[:academy_category])
      head :ok
    end

    private

    # Academy category
    def academy_category
      @academy_category = Academy::Category.find_by(slug: params[:id])
    end

    # Whitelist params
    def academy_category_params
      params.require(:academy_category).permit(
        image_params,
        thumb_params,
        cover_params,
        :meta_title,
        :meta_description,
        :meta_image_box,
        :meta_url,
        :title,
        :description,
        :published,
        :eml,
        :magestil,
        :magensinus,
        :position,
        :form_type,
        :email,
        :form_type
      )
    end
  end
end
