# frozen_string_literal: true

module ImageHelper
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
end
