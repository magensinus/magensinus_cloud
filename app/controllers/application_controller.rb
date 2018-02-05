# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Protect from forgery
  protect_from_forgery with: :exception
end
