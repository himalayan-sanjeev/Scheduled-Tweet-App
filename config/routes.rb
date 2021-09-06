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

  # Root route
  # get '/', to:'main#index' or
  # root to:'main#index' or
  root 'main#index'
  
end
