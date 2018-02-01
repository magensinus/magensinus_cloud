# frozen_string_literal: true

module Journal
  class AssetsController < ApplicationController
    before_action :journal_article
    before_action :journal_asset, only: [:show, :edit, :update, :destroy]

    # GET /journal_assets
    def index
      @journal_assets = @journal_article.assets.order(position: :asc)
    end

    # GET /journal_assets/1
    def show
    end

    # GET /journal_assets/1/edit
    def edit
    end

    # PATCH/PUT /journal_assets/1
    def update
      if @journal_asset.update(journal_asset_params)
        redirect_to journal_article_assets_path(@journal_article), notice: "Journal asset was successfully updated."
      else
        render :edit
      end
    end

    # DELETE /journal_assets/1
    def destroy
      @journal_asset.destroy
      redirect_to journal_article_assets_path(@journal_article), notice: "Journal asset was successfully destroyed."
    end

    # GET /journal_assets/new
    def new
      @journal_asset = @journal_article.assets.new
    end

    # POST /journal_assets
    def create
      assets = journal_article.assets
      order = assets.pluck(:position).compact
      @journal_asset = assets.new(journal_asset_params)
      order << 0
      @journal_asset.position = (order.min - 1)

      if @journal_asset.save
        redirect_to journal_article_assets_path(@journal_article), notice: "Journal asset was successfully created."
      else
        render :new
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def journal_article
      @journal_article = Journal::Article.find_by(slug: params[:article_id])
    end

    def journal_asset
      @journal_asset = @journal_article.assets.find_by(slug: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def journal_asset_params
      params.require(:journal_asset).permit(
        :journal_article_id,
        :text,
        :text_box,
        :image,
        :image_box,
        :image_caption,
        :remove_image_box,
        :video,
        :video_box,
        :video_caption,
        :video_service,
        :alignment,
        :position
      )
    end
  end
end
