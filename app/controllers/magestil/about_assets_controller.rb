# frozen_string_literal: true

module Magestil
  class AboutAssetsController < ApplicationController
    # Callbacks
    # ---------
    before_action :magestil_about_assets, only: [:index]
    before_action :magestil_about_asset, only: [:show, :edit, :update, :destroy]

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
      @magestil_about_asset = Magestil::AboutAsset.new
    end

    # Edit
    # ----
    def edit
    end

    # Create
    # ------
    def create
      order = Magestil::AboutAsset.pluck(:position).compact

      @magestil_about_asset = Magestil::AboutAsset.new(magestil_about_asset_params)
      order << 0
      @magestil_about_asset.position = (order.min - 1)
      if @magestil_about_asset.save
        @magestil_about_asset.image_box.recreate_versions!(:thumb) if @magestil_about_asset.image?
        flash[:notice] = "Successfully created..."
        redirect_to magestil_about_assets_path
      else
        render :new
      end
    end

    # Update
    # ------
    def update
      if @magestil_about_asset.update(magestil_about_asset_params)
        flash[:notice] = "Successfully updated..."
        redirect_to magestil_about_assets_path
      else
        render :edit
      end
    end

    # Destroy
    # -------
    def destroy
      @magestil_about_asset.destroy
      flash[:notice] = "Successfully destroyed..."
      redirect_to magestil_about_assets_path
    end

    # Sortable
    # --------
    def sortable
      Magestil::AboutAsset.sort_position(params[:magestil_about_asset])
      head :ok
    end

    private

    # Magestil about_asset
    def magestil_about_asset
      @magestil_about_asset = Magestil::AboutAsset.find_by(slug: params[:id])
    end

    # Magestil about assets
    def magestil_about_assets
      @magestil_about_assets ||= Magestil::AboutAsset.order(position: :asc)
    end

    # Whitelist params
    def magestil_about_asset_params
      params.require(:magestil_about_asset).permit(
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
