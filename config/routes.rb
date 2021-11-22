# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  # GET /about routes to index action of about controller
  
  # get '/about', to: 'about#index' here, '/' is optional
  
  # or if link_to helper is used in views
  # get "about-us", to:'about#index', as: :about
  #or
  get 'about',to:'about#index'
  

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

  delete "logout", to: "sessions#destroy"

  resources :twitter_accounts
  resources :tweets


  get "/auth/twitter/callback", to: "omniauth_callbacks#twitter"
  # Root route
  # get '/', to:'main#index' or
  # root to:'main#index' or
  root 'main#index'
  
end
