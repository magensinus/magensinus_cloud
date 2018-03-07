# frozen_string_literal: true

module Magestil
  class CampusAssetsController < ApplicationController
    # Callbacks
    # ---------
    # Magestil campus_asset
    before_action :magestil_campus_asset, only: [:show, :edit, :update, :destroy]

    # Index
    # -----
    def index
      @magestil_campus_assets = Magestil::CampusAsset.all
    end

    # Show
    # ----
    def show
    end

    # New
    # ---
    def new
      @magestil_campus_asset = Magestil::CampusAsset.new
    end

    # Edit
    # ----
    def edit
    end

    # Create
    # ------
    def create
      @magestil_campus_asset = Magestil::CampusAsset.new(magestil_campus_asset_params)
      if @magestil_campus_asset.save
        flash[:notice] = "Successfully created..."
        redirect_to magestil_campus_assets_path
      else
        render :new
      end
    end

    # Update
    # ------
    def update
      if @magestil_campus_asset.update(magestil_campus_asset_params)
        flash[:notice] = "Successfully updated..."
        redirect_to magestil_campus_assets_path
      else
        render :edit
      end
    end

    # Destroy
    # -------
    def destroy
      @magestil_campus_asset.destroy
      flash[:notice] = "Successfully destroyed..."
      redirect_to magestil_campus_assets_path
    end

    private

    # Magestil campus_asset
    def magestil_campus_asset
      @magestil_campus_asset = Magestil::CampusAsset.find_by(slug: params[:id])
    end

    # Whitelist params
    def magestil_campus_asset_params
      params.require(:magestil_campus_asset).permit(
        # Misc
        :position,
        # Image
        :image,
        :image_box,
        :image_caption,
        :remove_image_box,
        :image_box_cache
      )
    end
  end
end
