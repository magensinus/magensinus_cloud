# frozen_string_literal: true

module ApplicationHelper
  include Academy::EnrollmentHelper
  include Academy::SectionAssetHelper
  include Academy::SectionHelper
  include Journal::AssetHelper
  include Wallet::AssetHelper
  include Magensinus::NetworkHelper

  # Params all
  def params_all
    params[:all] == "true" || !params.key?(:all)
  end

  # Params show
  def params_show
    params[:action] == "show"
  end

  # Params new
  def params_new
    params[:action] == "new"
  end

  # Params create
  def params_create
    params[:action] == "create"
  end

  # Params edit
  def params_edit
    params[:action] == "edit"
  end

  # Params update
  def params_update
    params[:action] == "update"
  end

  # Params body
  def params_body
    params[:body] == "true"
  end

  # Params misc
  def params_misc
    params[:misc] == "true"
  end

  # Params text
  def params_text
    params[:text] == "true"
  end

  # Image
  # Params image
  def params_image
    params[:image] == "true"
  end

  # Params image eml
  def params_image_eml
    params[:image_eml] == "true"
  end

  # Params image magestil
  def params_image_magestil
    params[:image_magestil] == "true"
  end

  # Params image magensinus
  def params_image_magensinus
    params[:image_magensinus] == "true"
  end

  # Thumb
  # -----
  # Params thumb
  def params_thumb
    params[:thumb] == "true"
  end

  # Params thumb eml
  def params_thumb_eml
    params[:thumb_eml] == "true"
  end

  # Params thumb magestil
  def params_thumb_magestil
    params[:thumb_magestil] == "true"
  end

  # Params thumb magensinus
  def params_thumb_magensinus
    params[:thumb_magensinus] == "true"
  end

  # Cover
  # -----
  # Params cover
  def params_cover
    params[:cover] == "true"
  end

  # Params cover eml
  def params_cover_eml
    params[:cover_eml] == "true"
  end

  # Params cover magestil
  def params_cover_magestil
    params[:cover_magestil] == "true"
  end

  # Params cover magensinus
  def params_cover_magensinus
    params[:cover_magensinus] == "true"
  end

  # Document
  # --------
  # Params document
  def params_document
    params[:document] == "true"
  end

  # Params document eml
  def params_document_eml
    params[:document_eml] == "true"
  end

  # Params document magestil
  def params_document_magestil
    params[:document_magestil] == "true"
  end

  # Params document magensinus
  def params_document_magensinus
    params[:document_magensinus] == "true"
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
  def params_published
    params[:published] == "true"
  end

  # Params unpublished
  def params_unpublished
    params[:unpublished] == "true"
  end
end
