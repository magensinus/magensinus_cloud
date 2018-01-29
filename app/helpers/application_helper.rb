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
end
