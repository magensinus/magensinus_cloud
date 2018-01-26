# frozen_string_literal: true

module Journal
  class ArticlesController < ApplicationController
    before_action :set_journal_article, only: [:show, :edit, :update, :destroy]

    # GET /journal_articles
    def index
      @draft_journal_articles     = Journal::Article.draft
      @scheduled_journal_articles = Journal::Article.scheduled
      @published_journal_articles = Journal::Article.published
    end

    # GET /journal_articles/1
    def show
    end

    # GET /journal_articles/1/edit
    def edit
    end

    # GET /journal_articles/new
    def new
      @journal_article = Journal::Article.new
    end

    # POST /journal_articles
    def create
      @journal_article = Journal::Article.new(journal_article_params)

      if @journal_article.save
        redirect_to @journal_article, notice: 'Journal article was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /journal_articles/1
    def update
      if @journal_article.update(journal_article_params)
        redirect_to @journal_article, notice: 'Journal article was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /journal_articles/1
    def destroy
      @journal_article.destroy
      redirect_to journal_articles_path, notice: 'Journal article was successfully destroyed.'
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
