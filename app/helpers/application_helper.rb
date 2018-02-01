# frozen_string_literal: true

module ApplicationHelper
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
end
