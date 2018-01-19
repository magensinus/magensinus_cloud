# frozen_string_literal: true

class CreateWalletAssets < ActiveRecord::Migration[5.1]
  def change
    create_table :wallet_assets do |t|
      t.references  :wallet_category, foreign_key: true, index: true
      t.string      :slug, unique: true, index: true

      t.boolean     :document, default: false
      t.string      :document_box
      t.string      :document_caption

      t.integer     :position

      t.timestamps
    end
  end
end
