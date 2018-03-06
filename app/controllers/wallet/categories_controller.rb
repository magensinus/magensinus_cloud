# frozen_string_literal: true

module Wallet
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
    # Wallet category
    before_action :wallet_category, only: [:show, :edit, :update, :destroy]

    # Index
    # -----
    def index
      @wallet_categories = Wallet::Category.all
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
      if @wallet_category.update(wallet_category_params)
        flash[:notice] = "Successfully updated..."
        redirect_to @wallet_category
      else
        render :edit
      end
    end

    # Destroy
    # -------
    def destroy
      @wallet_category.destroy
      flash[:notice] = "Successfully destroyed..."
      redirect_to wallet_categories_url
    end

    # New
    # ---
    def new
      @wallet_category = Wallet::Category.new
    end

    # Create
    # ------
    def create
      order = Wallet::Category.pluck(:position).compact
      @wallet_category = Wallet::Category.new(wallet_category_params)
      order << 0
      @wallet_category.position = (order.min - 1)
      if @wallet_category.save
        flash[:notice] = "Successfully created..."
        redirect_to @wallet_category
      else
        render :new
      end
    end

    # Sortable
    # --------
    def sortable
      Wallet::Category.sort_position(params[:wallet_category])
      head :ok
    end

    private

    # Wallet category
    def wallet_category
      @wallet_category = Wallet::Category.find_by(slug: params[:id])
    end

    # Whitelist params
    def wallet_category_params
      params.require(:wallet_category).permit(
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
        :publish_at,
        :eml,
        :magestil,
        :magensinus,
        :position,
        :wallet_type
      )
    end
  end
end
