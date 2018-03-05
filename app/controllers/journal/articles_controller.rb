# frozen_string_literal: true

module Journal
  class ArticlesController < ApplicationController
    include ThumbParams
    include CoverParams

    before_action :journal_article, only: [:show, :edit, :update, :destroy]

    # Index
    # -----
    # GET /journal/articles
    def index
      @scheduled_journal_articles   ||= Journal::Article.scheduled
      @published_journal_articles   ||= Journal::Article.published
      @unpublished_journal_articles ||= Journal::Article.unpublished
    end

    # Show
    # ----
    # GET /journal/articles/KItfGH7E
    def show
    end

    # Edit
    # ----
    # GET /journal/articles/KItfGH7E/edit
    def edit
    end

    # Update
    # ------
    # PATCH/PUT /journal/articles/KItfGH7E
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
    # DELETE /journal/articles/KItfGH7E
    def destroy
      @journal_article.destroy
      flash[:notice] = "Successfully destroyed..."
      redirect_to journal_articles_path
    end

    # New
    # ---
    # GET /journal/articles/new
    def new
      @journal_article = Journal::Article.new
    end

    # Create
    # ------
    # POST /journal/articles
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

    # Whitelist parameters
    def journal_article_params
      params.require(:journal_article).permit(
        :meta_title,
        :meta_description,
        :meta_image_box,
        :meta_url,
        :title,
        :description,
        :published,
        :published_at,
        :eml,
        :magestil,
        :magensinus,
        thumb_params,
        cover_params
      )
    end
  end
end
