# frozen_string_literal: true

module IconHelper
  # Params icon
  def params_icon
    params[:icon] == "true"
  end

  # Params icon eml
  def params_icon_eml
    params[:icon_eml] == "true"
  end

  # Params icon magestil
  def params_icon_magestil
    params[:icon_magestil] == "true"
  end

  # Params icon magensinus
  def params_icon_magensinus
    params[:icon_magensinus] == "true"
  end
end
