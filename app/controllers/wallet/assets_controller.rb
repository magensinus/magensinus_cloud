# frozen_string_literal: true

module Wallet
  class AssetsController < ApplicationController
    before_action :wallet_category
    before_action :wallet_asset, only: [:show, :edit, :update, :destroy, :sortable]

    # Index
    # -----
    # GET /wallet/categories/N78jPa89/assets
    def index
      @wallet_assets = @wallet_category.assets.all
    end

    # Show
    # ----
    # GET /wallet/categories/N78jPa89/assets/yUj16K389
    def show
    end

    # Edit
    # ----
    # GET /wallet/categories/N78jPa89/assets/yUj16K389/edit
    def edit
    end

    # Update
    # ------
    # PATCH/PUT /wallet/categories/N78jPa89/assets/yUj16K389
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
    # DELETE /wallet/categories/N78jPa89/assets/yUj16K389
    def destroy
      @wallet_asset.destroy
      flash[:notice] = "Successfully destroyed..."
      redirect_to wallet_category_assets_path(@wallet_category)
    end

    # New
    # ---
    # GET /wallet/categories/N78jPa89/assets/new
    def new
      @wallet_asset = @wallet_category.assets.new
    end

    # Create
    # ------
    # POST /wallet/categories/N78jPa89/assets
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
    # PATCH /academy/categories
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

    # Whitelist parameters
    def wallet_asset_params
      params.require(:wallet_asset).permit(
        :wallet_category_id,
        :document,
        :document_box,
        :document_caption,
        :remove_document_box,
        :position
      )
    end
  end
end
