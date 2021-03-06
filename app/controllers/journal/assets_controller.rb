# frozen_string_literal: true

module Journal
  class AssetsController < ApplicationController
    # Callbacks
    # ---------
    # Journal article
    before_action :journal_article
    # Journal asset
    before_action :journal_asset, only: [:show, :edit, :update, :destroy, :sortable]

    # Index
    # -----
    def index
      @journal_assets = @journal_article.assets.order(position: :asc)
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
      if @journal_asset.update(journal_asset_params)
        flash[:notice] = "Successfully updated..."
        redirect_to journal_article_assets_path(@journal_article)
      else
        render :edit
      end
    end

    # Destroy
    # -------
    def destroy
      @journal_asset.destroy
      flash[:notice] = "Successfully destroyed..."
      redirect_to journal_article_assets_path(@journal_article)
    end

    # New
    # ---
    def new
      @journal_asset = @journal_article.assets.new
    end

    # Create
    # ------
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

    # Sortable
    # --------
    def sortable
      @journal_article.assets.sort_position(params[:journal_asset])
      head :ok
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

    # Whitelist params
    def journal_asset_params
      params.require(:journal_asset).permit(
        # Relationships
        :journal_article_id,
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
