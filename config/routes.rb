Jams::Application.routes.draw do
  resources :dinner_events

  resources :judges

  resources :people

  resources :events do
    resources :judges
    get :roster
  end

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
