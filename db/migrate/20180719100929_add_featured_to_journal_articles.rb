# frozen_string_literal: true

class AddFeaturedToJournalArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :journal_articles, :featured, :boolean, default: false
  end
end
