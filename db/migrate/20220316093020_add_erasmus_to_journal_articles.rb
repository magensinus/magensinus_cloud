# frozen_string_literal: true

class AddErasmusToJournalArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :journal_articles, :erasmus, :boolean, default: false
  end
end
