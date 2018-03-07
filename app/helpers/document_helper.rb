# frozen_string_literal: true

module DocumentHelper
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
end
