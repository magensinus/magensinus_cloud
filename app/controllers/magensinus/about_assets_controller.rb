# frozen_string_literal: true

module Magensinus
  class AboutAssetsController < ApplicationController
    # Callbacks
    # ---------
    before_action :magensinus_about_assets, only: [:index]
    # Magensinus about_asset
    before_action :magensinus_about_asset, only: [:show, :edit, :update, :destroy]

    # Index
    # -----
    def index
    end

    # Show
    # ----
    def show
    end

    # New
    # ---
    def new
      @magensinus_about_asset = Magensinus::AboutAsset.new
    end

    # Edit
    # ----
    def edit
    end

    # Create
    # ------
    def create
      order = Magensinus::AboutAsset.pluck(:position).compact

      @magensinus_about_asset = Magensinus::AboutAsset.new(magensinus_about_asset_params)
      order << 0
      @magensinus_about_asset.position = (order.min - 1)
      if @magensinus_about_asset.save
        flash[:notice] = "Successfully created..."
        redirect_to magensinus_about_assets_path
      else
        render :new
      end
    end

    # Update
    # ------
    def update
      if @magensinus_about_asset.update(magensinus_about_asset_params)
        flash[:notice] = "Successfully updated..."
        redirect_to magensinus_about_assets_path
      else
        render :edit
      end
    end

    # Destroy
    # -------
    def destroy
      @magensinus_about_asset.destroy
      flash[:notice] = "Successfully destroyed..."
      redirect_to magensinus_about_assets_path
    end

    # Sortable
    # --------
    def sortable
      Magensinus::AboutAsset.sort_position(params[:magensinus_about_asset])
      head :ok
    end

    private

    # Magensinus about_asset
    def magensinus_about_asset
      @magensinus_about_asset = Magensinus::AboutAsset.find_by(slug: params[:id])
    end

    def magensinus_about_assets
      @magensinus_about_assets = Magensinus::AboutAsset.order(position: :asc)
    end

    # Whitelist params
    def magensinus_about_asset_params
      params.require(:magensinus_about_asset).permit(
        # Misc
        :position,
        # Text
        :text,
        :text_box,
        # Image
        :image,
        :image_box,
        :image_caption,
        :remove_image_box,
        :image_box_cache,
        # Document
        :document,
        :document_box,
        :remove_document_box,
        :document_box_cache,
        :document_caption,
        # Video
        :video,
        :video_box,
        :video_caption,
        :video_service
      )
    end
  end
end
