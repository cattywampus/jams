Jams::Application.routes.draw do
  resources :judges

  resources :people do 
    resources :comments
  end

  resources :events do
    resources :judges
    get :roster

    resource :dinner, controller: "dinner_events" do 
      resources :attendees
      post :rsvp
    end
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

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}, skip: :registrations
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
