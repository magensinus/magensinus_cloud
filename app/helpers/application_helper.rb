# frozen_string_literal: true

module ApplicationHelper
  include CrudHelper
  include CoverHelper
  include IconHelper
  include ThumbHelper
  include ImageHelper
  include DocumentHelper
  include Academy::EnrollmentHelper
  include Academy::SectionAssetHelper
  include Academy::SectionHelper
  include Journal::AssetHelper
  include Magensinus::NetworkHelper
  include Magensinus::SettingsHelper
  include Magestil::NetworkHelper
  include Magestil::SettingsHelper
  include Wallet::AssetHelper

  # Params all
  def params_all
    params[:all] == "true" || !params.key?(:all)
  end

  # Params published
  def params_published
    params[:published] == "true"
  end

  # Params unpublished
  def params_unpublished
    params[:published] == "false"
  end

  # Params body
  def params_body
    params[:body] == "true"
  end

  # Params misc
  def params_misc
    params[:misc] == "true"
  end

  # Params theme
  def params_theme
    params[:theme] == "true"
  end

  # Params text
  def params_text
    params[:text] == "true"
  end

  # Video
  # -----
  # Params video
  def params_video
    params[:video] == "true"
  end

  # Params scheduled
  def params_scheduled
    params[:scheduled] == "true"
  end

  # Params published
  # def params_published
  #   params[:published] == "true"
  # end

  # Params unpublished
  # def params_unpublished
  #   params[:unpublished] == "true"
  # end

  # Object published
  def object_published(object)
    if object.published?
      "Published"
    else
      "Unpublished"
    end
  end

  # Assets
  def asset_type(object = "")
    if object.text == true
      "Text"
    elsif object.image == true
      "Image"
    elsif object.video == true
      "Video"
    elsif object.document == true
      "Document"
    end
  end
end
