# frozen_string_literal: true

module Wallet
  class CategoriesController < ApplicationController
    # Params
    # ------
    # Thumb
    include ThumbParams
    # Cover
    include CoverParams
    # Image
    include ImageParams

    # Callbacks
    # ---------
    # Wallet category
    before_action :wallet_category, only: [:show, :edit, :update, :destroy]

    # Index
    # -----
    def index
      # redirect_to wallet_root_path
      # @wallet_categories = Wallet::Category.all
      @wallet_categories =
        if params[:published] == "true"
          Wallet::Category.where(published: true).order(position: :asc)
        elsif params[:published] == "false"
          Wallet::Category.where(published: false).order(position: :asc)
        else
          Wallet::Category.order(position: :asc)
        end
    end

    # Show
    # ----
    def show
      @wallet_assets = @wallet_category.assets.order(position: :asc)
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
        thumb_params,
        cover_params,
        image_params,
        # Meta tags
        :meta_title,
        :meta_description,
        :meta_image_box,
        :meta_url,
        # Misc
        :title,
        :description,
        :published,
        :publish_at,
        :wallet_type,
        :position,
        # Schools
        :eml,
        :magestil,
        :magensinus
      )
    end
  end
end
