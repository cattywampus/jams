Jams::Application.routes.draw do
  resources :teams

  resources :judges do
    member do
      get :evaluate
    end
  end

  resources :people do
    resources :comments
  end

  namespace :reports do
    resource :evaluations, only: [:show]
  end

  resources :events do
    resources :judges do
      collection do
        post :import
      end
    end
    get :roster

    resource :dinner, controller: "dinner_events" do
      resources :attendees
      post :rsvp
    end
    resource :evaluations, only: [:show], controller: "reports/evaluations"
    resource :shirts, only: [:show], controller: "reports/shirts"
    resource :name_cards, only: [:show], controller: "reports/namecards"
    resources :biographies, controller: "reports/biographies" do
      put :approved
    end

    scope module: "tools" do
      resource :email_builder, only: [:show], controller: "email_builder"
    end
  end
  get "/events/:id/candidates" => "events#candidates", as: "event_candidates"

  resources :games

  root :to => "home#index"

  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks",
    invitations: "users/invitations"
  }, skip: :registrations
  devise_scope :user do
    resource :registration,
      only: [:edit, :update],
      path: 'users',
      controller: 'devise_invitable/registrations',
      as: :user_registration do
        get :cancel
      end
  end
  resources :users
  resources :programs
end
