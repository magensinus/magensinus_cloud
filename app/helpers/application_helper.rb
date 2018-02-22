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

  # Params image
  def params_image
    params[:image] == "true"
  end

  # Params thumb
  def params_thumb
    params[:thumb] == "true"
  end

  # Params cover
  def params_cover
    params[:cover] == "true"
  end

  # Params video
  def params_video
    params[:video] == "true"
  end

  # Params document
  def params_document
    params[:document] == "true"
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
