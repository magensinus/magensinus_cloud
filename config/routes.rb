# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "home#show"
  resource :home, controller: :home

  namespace :magensinus do
    root to: "settings#show"
    resource :settings, controller: :settings
    resource :home, controller: :home
    resource :about, controller: :about
    resource :quality, controller: :quality
    resource :courses, controller: :courses
    resource :articles, controller: :articles
    resource :contact, controller: :contact
  end
end
