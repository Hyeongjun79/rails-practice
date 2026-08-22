Rails.application.routes.draw do
  get "sessions/new"
  root "static_pages#home"

  get "games/index"
  resources :games, only: [ :index ]
  resources :users

  get "static_pages/home"
  get "static_pages/help"
  get "static_pages/about"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :users
end
