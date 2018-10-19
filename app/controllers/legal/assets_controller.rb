# frozen_string_literal: true

module Legal
  class AssetsController < ApplicationController
    # Callbacks
    # ---------
    # Legal article
    before_action :legal_article
    # Legal asset
    before_action :legal_asset, only: [:show, :edit, :update, :destroy, :sortable]

    # Index
    # -----
    def index
      @legal_assets = @legal_article.assets.order(position: :asc)
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
      if @legal_asset.update(legal_asset_params)
        flash[:notice] = "Successfully updated..."
        redirect_to legal_article_assets_path(@legal_article)
      else
        render :edit
      end
    end

    # Destroy
    # -------
    def destroy
      @legal_asset.destroy
      flash[:notice] = "Successfully destroyed..."
      redirect_to legal_article_assets_path(@legal_article)
    end

    # New
    # ---
    def new
      @legal_asset = @legal_article.assets.new
    end

    # Create
    # ------
    def create
      assets = legal_article.assets
      order = assets.pluck(:position).compact
      @legal_asset = assets.new(legal_asset_params)
      order << 0
      @legal_asset.position = (order.min - 1)
      if @legal_asset.save
        flash[:notice] = "Successfully created..."
        redirect_to legal_article_assets_path(@legal_article)
      else
        render :new
      end
    end

    # Sortable
    # --------
    def sortable
      @legal_article.assets.sort_position(params[:legal_asset])
      head :ok
    end

    private

    # Legal article
    def legal_article
      @legal_article = Legal::Article.find_by(slug: params[:article_id])
    end

    # Legal asset
    def legal_asset
      @legal_asset = @legal_article.assets.find_by(slug: params[:id])
    end

    # Whitelist params
    def legal_asset_params
      params.require(:legal_asset).permit(
        # Relationships
        :legal_article_id,
        # Misc
        :alignment,
        :position,
        # Text
        :text,
        :text_box,
        # Image
        :image,
        :image_box,
        :remove_image_box,
        :image_box_cache,
        :image_caption,
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
