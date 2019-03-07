# frozen_string_literal: true

module Magensinus
  class AboutAssetsController < ApplicationController
    # Callbacks
    # ---------
    # Magensinus about_asset
    before_action :magensinus_about_asset, only: [:show, :edit, :update, :destroy]

    # Index
    # -----
    def index
      @magensinus_about_assets = Magensinus::AboutAsset.all
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
      @magensinus_about_asset = Magensinus::AboutAsset.new(magensinus_about_asset_params)
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

    private

    # Magensinus about_asset
    def magensinus_about_asset
      @magensinus_about_asset = Magensinus::AboutAsset.find_by(slug: params[:id])
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
