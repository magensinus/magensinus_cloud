# frozen_string_literal: true

class AddPositionToJournalArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :journal_articles, :position, :integer
  end
end
