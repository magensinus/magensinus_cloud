# frozen_string_literal: true

class AddAssetsToAbout < ActiveRecord::Migration[5.1]
  def change
    add_column :magestil_about_assets, :alignment, :string
    add_column :magestil_about_assets, :text, :boolean, default: false
    add_column :magestil_about_assets, :text_box, :string
    add_column :magestil_about_assets, :document, :boolean, default: false
    add_column :magestil_about_assets, :document_box, :string
    add_column :magestil_about_assets, :document_caption, :string
    add_column :magestil_about_assets, :video, :boolean, default: false
    add_column :magestil_about_assets, :video_box, :string
    add_column :magestil_about_assets, :video_caption, :string
    add_column :magestil_about_assets, :video_service, :string
  end
end
