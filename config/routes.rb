# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "dashboard#show"
  resource :dashboard, controller: :dashboard

  namespace :magestil do
    root to: "dashboard#show"
    resource :dashboard,            controller: :dashboard
    resource :settings,             controller: :settings
    resource :home,                 controller: :home
    resource :about,                controller: :about
    resource :quality,              controller: :quality
    resource :campus,               controller: :campus
    resource :equipment,            controller: :equipment
    resource :partnerships,         controller: :partnerships
    resource :students,             controller: :students
    resource :parents,              controller: :parents
    resource :tutors,               controller: :tutors
    resource :courses,              controller: :courses
    resource :articles,             controller: :articles
    resource :contact,              controller: :contact
    resource :newsletter,           controller: :newsletter
    resource :terms_and_conditions, controller: :terms_and_conditions
    # Plugins
    resources :networks,            controller: :networks
    resources :campus_assets,       controller: :campus_assets
    resources :equipment_assets,    controller: :equipment_assets
    resources :about_assets,        controller: :about_assets
  end

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
    # Plugins
    resources :networks,  controller: :networks
  end

  namespace :legal do
    root to: "dashboard#show"
    resource :dashboard, controller: :dashboard
    resources :articles, controller: :articles do
      resources :assets, controller: :assets do
        collection do
          patch :sortable
        end
      end
    end
  end

  namespace :journal do
    root to: "dashboard#show"
    resource :dashboard, controller: :dashboard
    resources :articles, controller: :articles do
      resources :assets, controller: :assets do
        collection do
          patch :sortable
        end
      end
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
    root to: "dashboard#show"
    resource :dashboard, controller: :dashboard
    resources :badges, controller: :badges do
      collection do
        patch :sortable
      end
    end
  end

  namespace :partnerships do
    root to: "dashboard#show"
    resource :dashboard, controller: :dashboard
    resources :identities, controller: :identities do
      collection do
        patch :sortable
      end
    end
  end

  resources :subscriptions, controller: :subscriptions
end
