# frozen_string_literal: true

module Legal
  class ArticlesController < ApplicationController
    # Params
    # ------
    # Thumb
    include ThumbParams
    # Cover
    include CoverParams
    # Image
    include ImageParams
    # Document
    include DocumentParams
    # Application Helper
    include  ApplicationHelper

    # Callbacks
    # ---------
    # Legal Article
    before_action :legal_article, only: [:show, :edit, :update, :destroy]

    # Index
    # -----
    def index
      @legal_articles =
        if params_unpublished
          Legal::Article.unpublished.order(created_at: :asc)
        else
          Legal::Article.published.order(created_at: :asc)
        end
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
      if @legal_article.update(legal_article_params)
        flash[:notice] = "Successfully updated..."
        redirect_to legal_article_path(@legal_article)
      else
        render :edit
      end
    end

    # Destroy
    # -------
    def destroy
      @legal_article.destroy
      flash[:notice] = "Successfully destroyed..."
      redirect_to legal_articles_path
    end

    # New
    # ---
    def new
      @legal_article = Legal::Article.new
    end

    # Create
    # ------
    def create
      @legal_article = Legal::Article.new(legal_article_params)
      if @legal_article.save
        flash[:notice] = "Successfully created..."
        redirect_to legal_article_path(@legal_article)
      else
        render :new
      end
    end

    private

    # Legal article
    def legal_article
      @legal_article = Legal::Article.find_by(slug: params[:id])
    end

    # Whitelist params
    def legal_article_params
      params.require(:legal_article).permit(
        thumb_params,
        cover_params,
        image_params,
        document_params,
        # Meta tags
        :meta_title,
        :meta_description,
        :meta_image_box,
        :meta_url,
        # Misc
        :title,
        :description,
        :published,
        :published_at,
        # Schools
        :eml,
        :magestil,
        :magensinus,
        :featured
      )
    end
  end
end
