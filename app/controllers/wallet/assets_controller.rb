# frozen_string_literal: true

module Wallet
  class AssetsController < ApplicationController
    before_action :wallet_category
    before_action :wallet_asset, only: [:show, :edit, :update, :destroy]

    # GET /wallet_assets
    def index
      @wallet_assets = @wallet_category.assets.all
    end

    # GET /wallet_assets/1
    def show
    end

    # GET /wallet_assets/new
    def new
      @wallet_asset = @wallet_category.assets.new
    end

    # GET /wallet_assets/1/edit
    def edit
    end

    # POST /wallet_assets
    def create
      assets = wallet_category.assets
      order = assets.pluck(:position).compact
      @wallet_asset = assets.new(wallet_asset_params)
      order << 0
      @wallet_asset.position = (order.min - 1)

      if @wallet_asset.save
        redirect_to wallet_category_asset_path(@wallet_category, @wallet_asset), notice: "Wallet asset was successfully created."
      else
        render :new
      end
    end

    # PATCH/PUT /wallet_assets/1
    def update
      if @wallet_asset.update(wallet_asset_params)
        redirect_to wallet_category_asset_path(@wallet_category, @wallet_asset), notice: "Wallet asset was successfully updated."
      else
        render :edit
      end
    end

    # DELETE /wallet_assets/1
    def destroy
      @wallet_asset.destroy
      redirect_to wallet_category_assets_path(@wallet_category), notice: "Wallet asset was successfully destroyed."
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def wallet_category
      @wallet_category = Wallet::Category.find_by(slug: params[:category_id])
    end

    def wallet_asset
      @wallet_asset = @wallet_category.assets.find_by(slug: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wallet_asset_params
      params.require(:wallet_asset).permit(
        :wallet_category_id,
        :document,
        :document_box,
        :document_caption,
        :position
      )
    end
  end
end
