# frozen_string_literal: true

module CoverHelper
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
end
