# frozen_string_literal: true

module Journal
  class AssetsController < ApplicationController
    before_action :journal_article
    before_action :journal_asset, only: [:show, :edit, :update, :destroy]

    # GET /journal/articles/KItfGH7E/assets
    def index
      @journal_assets = @journal_article.assets.order(position: :asc)
    end

    # GET /journal/articles/KItfGH7E/assets/BHdGTS6D
    def show
    end

    # GET /journal/articles/KItfGH7E/assets/BHdGTS6D/edit
    def edit
    end

    # PATCH/PUT /journal/articles/KItfGH7E/assets/BHdGTS6D
    def update
      if @journal_asset.update(journal_asset_params)
        flash[:notice] = "Successfully updated..."
        redirect_to journal_article_assets_path(@journal_article)
      else
        render :edit
      end
    end

    # DELETE /journal/articles/KItfGH7E/assets/BHdGTS6D
    def destroy
      @journal_asset.destroy
      flash[:notice] = "Successfully destroyed..."
      redirect_to journal_article_assets_path(@journal_article)
    end

    # GET /journal/articles/KItfGH7E/assets/new
    def new
      @journal_asset = @journal_article.assets.new
    end

    # POST /journal/articles/KItfGH7E/assets
    def create
      assets = journal_article.assets
      order = assets.pluck(:position).compact
      @journal_asset = assets.new(journal_asset_params)
      order << 0
      @journal_asset.position = (order.min - 1)

      if @journal_asset.save
        flash[:notice] = "Successfully created..."
        redirect_to journal_article_assets_path(@journal_article)
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
