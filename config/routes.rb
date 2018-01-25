# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "dashboard#show"
  resource :dashboard, controller: :dashboard

  namespace :magensinus do
    root to: "dashboard#show"
    resource :dashboard, controller: :dashboard
    resource :settings, controller: :settings
    resource :home, controller: :home
    resource :about, controller: :about
    resource :quality, controller: :quality
    resource :courses, controller: :courses
    resource :articles, controller: :articles
    resource :contact, controller: :contact
    resource :newsletter, controller: :newsletter
  end

  namespace :journal do
    root to: "dashboard#show"
    resource :dashboard, controller: :dashboard
    resources :articles, controller: :articles do
      resources :assets, controller: :assets
    end
  end

  namespace :wallet do
    root to: "dashboard#show"
    resource :dashboard, controller: :dashboard
    resources :categories, controller: :categories do
      resources :assets, controller: :assets
    end
  end

  resources :subscriptions, controller: :subscriptions
end
