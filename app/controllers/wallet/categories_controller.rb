# frozen_string_literal: true

module Wallet
  class CategoriesController < ApplicationController
    before_action :set_wallet_category, only: [:show, :edit, :update, :destroy]

    # GET /wallet_categories
    def index
      @wallet_categories = Wallet::Category.all
    end

    # GET /wallet_categories/1
    def show
    end

    # GET /wallet_categories/new
    def new
      @wallet_category = Wallet::Category.new
    end

    # GET /wallet_categories/1/edit
    def edit
    end

    # POST /wallet_categories
    def create
      @wallet_category = Wallet::Category.new(wallet_category_params)
      if @wallet_category.save
        redirect_to @wallet_category, notice: "Wallet category was successfully created."
      else
        render :new
      end
    end

    # PATCH/PUT /wallet_categories/1
    def update
      if @wallet_category.update(wallet_category_params)
        redirect_to @wallet_category, notice: "Wallet category was successfully updated."
      else
        render :edit
      end
    end

    # DELETE /wallet_categories/1
    def destroy
      @wallet_category.destroy
      redirect_to wallet_categories_url, notice: "Wallet category was successfully destroyed."
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
        :magensinus
      )
    end
  end
end
