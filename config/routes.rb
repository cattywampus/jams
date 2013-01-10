Jams::Application.routes.draw do
  resources :events

  resources :games

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  # devise_scope :user do
  #   match '/users/auth/:action/callback(.format)' => 'omniauth_callbacks#(?-mix:openid)', method: :post, as: :user_omniauth_callback
  # end
  resources :users
  resources :programs
end