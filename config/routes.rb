# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "dashboard#show"
  resource :dashboard, controller: :dashboard

  namespace :magensinus do
    root to: "dashboard#show"
    resource :dashboard,  controller: :dashboard
    resource :settings,   controller: :settings
    resource :home,       controller: :home
    resource :about,      controller: :about
    resource :quality,    controller: :quality
    resource :courses,    controller: :courses
    resource :articles,   controller: :articles
    resource :contact,    controller: :contact
    resource :newsletter, controller: :newsletter
    resource :schools,    controller: :schools
    resources :networks,  controller: :networks
  end

  namespace :journal do
    root to: "dashboard#show"
    resource :dashboard, controller: :dashboard
    resources :articles, controller: :articles do
      resources :assets, controller: :assets
    end
  end

  namespace :academy do
    root to: "dashboard#show"
    resource :dashboard, controller: :dashboard
    resources :categories, controller: :categories do
      collection do
        patch :sortable
      end
      resources :enrollments, controller: :enrollments
    end
    resources :courses, controller: :courses do
      collection do
        patch :sortable
      end
      resources :sections, controller: :sections do
        resources :section_assets, controller: :section_assets do
          collection do
            patch :sortable
          end
        end
      end
      resources :course_tutors, controller: :course_tutors do
        collection do
          patch :sortable
        end
      end
    end
    resources :enrollments, controller: :enrollments
    resources :tutors, controller: :tutors
    resources :schools, controller: :schools
  end

  namespace :wallet do
    root to: "dashboard#show"
    resource :dashboard, controller: :dashboard
    resources :categories, controller: :categories do
      collection do
        patch :sortable
      end
      resources :assets, controller: :assets do
        collection do
          patch :sortable
        end
      end
    end
  end

  namespace :endorsement do
    resources :badges, controller: :badges do
      collection do
        patch :sortable
      end
    end
  end

  resources :subscriptions, controller: :subscriptions
end
