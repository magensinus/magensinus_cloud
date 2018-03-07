# frozen_string_literal: true

module Wallet
  class AssetsController < ApplicationController
    # Callbacks
    # ---------
    # Wallet category
    before_action :wallet_category
    # Wallet asset
    before_action :wallet_asset, only: [:show, :edit, :update, :destroy, :sortable]

    # Index
    # -----
    def index
      @wallet_assets = @wallet_category.assets.all
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
      if @wallet_asset.update(wallet_asset_params)
        flash[:notice] = "Successfully updated..."
        redirect_to wallet_category_asset_path(@wallet_category, @wallet_asset)
      else
        render :edit
      end
    end

    # Destroy
    # -------
    def destroy
      @wallet_asset.destroy
      flash[:notice] = "Successfully destroyed..."
      redirect_to wallet_category_assets_path(@wallet_category)
    end

    # New
    # ---
    def new
      @wallet_asset = @wallet_category.assets.new
    end

    # Create
    # ------
    def create
      assets = wallet_category.assets
      order = assets.pluck(:position).compact
      @wallet_asset = assets.new(wallet_asset_params)
      order << 0
      @wallet_asset.position = (order.min - 1)
      if @wallet_asset.save
        flash[:notice] = "Successfully created..."
        redirect_to wallet_category_asset_path(@wallet_category, @wallet_asset)
      else
        render :new
      end
    end

    # Sortable
    # --------
    def sortable
      @wallet_category.assets.sort_position(params[:wallet_asset])
      head :ok
    end

    private

    # Wallet category
    def wallet_category
      @wallet_category = Wallet::Category.find_by(slug: params[:category_id])
    end

    # Wallet asset
    def wallet_asset
      @wallet_asset = @wallet_category.assets.find_by(slug: params[:id])
    end

    # Whitelist params
    def wallet_asset_params
      params.require(:wallet_asset).permit(
        # Relationships
        :wallet_category_id,
        # Misc
        :position,
        # Document
        :document,
        :document_box,
        :remove_document_box,
        :document_box_cache,
        :document_caption
      )
    end
  end
end
