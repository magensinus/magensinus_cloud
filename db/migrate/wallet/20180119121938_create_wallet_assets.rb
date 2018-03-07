# frozen_string_literal: true

class CreateWalletAssets < ActiveRecord::Migration[5.1]
  def change
    create_table :wallet_assets do |t|
      t.string      :slug, unique: true, index: true
      # Relationships
      t.references  :wallet_category, foreign_key: true, index: true
      # Misc
      t.string      :alignment
      t.integer     :position
      # Document
      t.boolean     :document, default: false
      t.string      :document_box
      t.string      :document_caption

      t.timestamps
    end
  end
end
