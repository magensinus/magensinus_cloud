# frozen_string_literal: true

module Wallet
  class CategoriesController < ApplicationController
    before_action :set_wallet_category, only: [:show, :edit, :update, :destroy]

    # GET /wallet/categories
    def index
      @wallet_categories = Wallet::Category.all
    end

    # GET /wallet/categories/N78jPa89
    def show
    end

    # GET /wallet/categories/N78jPa89/edit
    def edit
    end

    # PATCH/PUT /wallet/categories/N78jPa89
    def update
      if @wallet_category.update(wallet_category_params)
        flash[:notice] = "Successfully updated..."
        redirect_to @wallet_category
      else
        render :edit
      end
    end

    # DELETE /wallet/categories/N78jPa89
    def destroy
      @wallet_category.destroy
      flash[:notice] = "Successfully destroyed..."
      redirect_to wallet_categories_url
    end

    # GET /wallet/categories/new
    def new
      @wallet_category = Wallet::Category.new
    end

    # POST /wallet/categories
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

    # PATCH /academy/categories
    def sortable
      Wallet::Category.sort_position(params[:wallet_category])
      head :ok
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_wallet_category
      @wallet_category = Wallet::Category.find_by(slug: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wallet_category_params
      params.require(:wallet_category).permit(
        :meta_title,
        :meta_description,
        :meta_image_box,
        :meta_url,
        :title,
        :description,
        :thumb,
        :thumb_box,
        :thumb_caption,
        :cover,
        :cover_box,
        :cover_caption,
        :published,
        :publish_at,
        :eml,
        :magestil,
        :magensinus,
        :position
      )
    end
  end
end
