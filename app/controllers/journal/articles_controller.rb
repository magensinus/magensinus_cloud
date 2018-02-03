# frozen_string_literal: true

module Journal
  class ArticlesController < ApplicationController
    before_action :set_journal_article, only: [:show, :edit, :update, :destroy]

    # GET /journal/articles
    def index
      @draft_journal_articles     ||= Journal::Article.draft
      @scheduled_journal_articles ||= Journal::Article.scheduled
      @published_journal_articles ||= Journal::Article.published
    end

    # GET /journal/articles/KItfGH7E
    def show
    end

    # GET /journal/articles/KItfGH7E/edit
    def edit
    end

    # PATCH/PUT /journal/articles/KItfGH7E
    def update
      if @journal_article.update(journal_article_params)
        flash[:notice] = "Successfully updated..."
        redirect_to journal_article_path(@journal_article)
      else
        render :edit
      end
    end

    # DELETE /journal/articles/KItfGH7E
    def destroy
      @journal_article.destroy
      flash[:notice] = "Successfully destroyed..."
      redirect_to journal_articles_path
    end

    # GET /journal/articles/new
    def new
      @journal_article = Journal::Article.new
    end

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

    # Use callbacks to share common setup or constraints between actions.
    def set_journal_article
      @journal_article = Journal::Article.find_by(slug: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def journal_article_params
      params.require(:journal_article).permit(
        :meta_title,
        :meta_description,
        :meta_image_box,
        :meta_url,
        :title,
        :description,
        :thumb,
        :thumb_box,
        :thumb_caption,
        :remove_thumb_box,
        :cover,
        :cover_box,
        :cover_caption,
        :remove_cover_box,
        :draft,
        :published_at,
        :eml,
        :magestil,
        :magensinus
      )
    end
  end
end
