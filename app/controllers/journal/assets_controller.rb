# frozen_string_literal: true

module Journal
  class AssetsController < ApplicationController
    before_action :journal_article
    before_action :journal_asset, only: [:show, :edit, :update, :destroy]

    # Index
    # -----
    # GET /journal/articles/KItfGH7E/assets
    def index
      @journal_assets = @journal_article.assets.order(position: :asc)
    end

    # Show
    # ----
    # GET /journal/articles/KItfGH7E/assets/BHdGTS6D
    def show
    end

    # Edit
    # ----
    # GET /journal/articles/KItfGH7E/assets/BHdGTS6D/edit
    def edit
    end

    # Update
    # ------
    # PATCH/PUT /journal/articles/KItfGH7E/assets/BHdGTS6D
    def update
      if @journal_asset.update(journal_asset_params)
        flash[:notice] = "Successfully updated..."
        redirect_to journal_article_assets_path(@journal_article)
      else
        render :edit
      end
    end

    # Destroy
    # -------
    # DELETE /journal/articles/KItfGH7E/assets/BHdGTS6D
    def destroy
      @journal_asset.destroy
      flash[:notice] = "Successfully destroyed..."
      redirect_to journal_article_assets_path(@journal_article)
    end

    # New
    # ---
    # GET /journal/articles/KItfGH7E/assets/new
    def new
      @journal_asset = @journal_article.assets.new
    end

    # Create
    # ------
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

    # Journal article
    def journal_article
      @journal_article = Journal::Article.find_by(slug: params[:article_id])
    end

    # Journal asset
    def journal_asset
      @journal_asset = @journal_article.assets.find_by(slug: params[:id])
    end

    # Whitelist parameters
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
