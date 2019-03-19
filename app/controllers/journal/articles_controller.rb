# frozen_string_literal: true

module Journal
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

    # Callbacks
    # ---------
    # Journal Article
    before_action :journal_article, only: [:show, :edit, :update, :destroy]

    # Index
    # -----
    def index
      @journal_articles             = Journal::Article.order(position: :asc)
      @scheduled_journal_articles   = Journal::Article.scheduled
      @published_journal_articles   = Journal::Article.published
      @unpublished_journal_articles = Journal::Article.unpublished
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
      if @journal_article.update(journal_article_params)
        flash[:notice] = "Successfully updated..."
        redirect_to journal_article_path(@journal_article)
      else
        render :edit
      end
    end

    # Destroy
    # -------
    def destroy
      @journal_article.destroy
      flash[:notice] = "Successfully destroyed..."
      redirect_to journal_articles_path
    end

    # New
    # ---
    def new
      @journal_article = Journal::Article.new
    end

    # Create
    # ------
    def create
      @journal_article = Journal::Article.new(journal_article_params)
      if @journal_article.save
        flash[:notice] = "Successfully created..."
        redirect_to journal_article_path(@journal_article)
      else
        render :new
      end
    end

    private

    # Journal article
    def journal_article
      @journal_article = Journal::Article.find_by(slug: params[:id])
    end

    # Whitelist params
    def journal_article_params
      params.require(:journal_article).permit(
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
