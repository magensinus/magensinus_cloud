# frozen_string_literal: true

module Academy
  class CategoriesController < ApplicationController
    include ThumbParams
    include CoverParams

    # Callbacks
    # ---------
    # Academy category
    before_action :academy_category, only: [:show, :edit, :update, :destroy]

    # Index
    # -----
    # GET /academy/categories
    def index
      @academy_categories ||= Academy::Category.all
    end

    # Show
    # ----
    # GET /academy/categories/AXuyFD1I
    def show
    end

    # Edit
    # ----
    # GET /academy/categories/AXuyFD1I/edit
    def edit
    end

    # Update
    # ------
    # PATCH/PUT /academy/categories/AXuyFD1I
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
    # DELETE /academy/categories/AXuyFD1I
    def destroy
      @academy_category.destroy
      flash[:notice] = "Successfully destroyed..."
      redirect_to academy_categories_path
    end

    # New
    # ---
    # GET /academy/categories/new
    def new
      @academy_category = Academy::Category.new
    end

    # Create
    # ------
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

    # Sortable
    # --------
    # PATCH /academy/categories
    def sortable
      Academy::Category.sort_position(params[:academy_category])
      head :ok
    end

    private

    # Academy category
    def academy_category
      @academy_category = Academy::Category.find_by(slug: params[:id])
    end

    # Whitelist parameters
    def academy_category_params
      params.require(:academy_category).permit(
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
