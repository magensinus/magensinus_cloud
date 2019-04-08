# frozen_string_literal: true

module Magestil
  class EquipmentAssetsController < ApplicationController
    # Callbacks
    # ---------
    # Magestil equipment_asset
    before_action :magestil_equipment_asset, only: [:show, :edit, :update, :destroy]

    # Index
    # -----
    def index
      @magestil_equipment_assets = Magestil::EquipmentAsset.all
    end

    # Show
    # ----
    def show
    end

    # New
    # ---
    def new
      @magestil_equipment_asset = Magestil::EquipmentAsset.new
    end

    # Edit
    # ----
    def edit
    end

    # Create
    # ------
    def create
      order = Magestil::EquipmentAsset.pluck(:position).compact

      @magestil_equipment_asset = Magestil::EquipmentAsset.new(magestil_equipment_asset_params)
      order << 0
      @magestil_equipment_asset.position = (order.min - 1)
      if @magestil_equipment_asset.save
        flash[:notice] = "Successfully created..."
        redirect_to magestil_equipment_assets_path
      else
        render :new
      end
    end

    # Update
    # ------
    def update
      if @magestil_equipment_asset.update(magestil_equipment_asset_params)
        # @magestil_equipment_asset.image_box.recreate_versions!(:thumb) if @magestil_equipment_asset.image?

        # Fog recreate
        # ym = @magestil_equipment_asset
        # ym.image_box.cache_stored_file!
        # ym.image_box.retrieve_from_cache!(ym.image_box.cache_name)
        # ym.image_box.recreate_versions!(:version1, :version2)
        # ym.save!

        flash[:notice] = "Successfully updated..."
        redirect_to magestil_equipment_assets_path
      else
        render :edit
      end
    end

    # Destroy
    # -------
    def destroy
      @magestil_equipment_asset.destroy
      flash[:notice] = "Successfully destroyed..."
      redirect_to magestil_equipment_assets_path
    end

    # Sortable
    # --------
    def sortable
      Magestil::EquipmentAsset.sort_position(params[:magestil_equipment_asset])
      head :ok
    end

    private

    # Magestil equipment_asset
    def magestil_equipment_asset
      @magestil_equipment_asset = Magestil::EquipmentAsset.find_by(slug: params[:id])
    end

    # Whitelist params
    def magestil_equipment_asset_params
      params.require(:magestil_equipment_asset).permit(
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
