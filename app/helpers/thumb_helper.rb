# frozen_string_literal: true

module ThumbHelper
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
end
