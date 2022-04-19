# == Route Map
#

Rails.application.routes.draw do
  get "/health", to: ->(env) { [204, {}, [""]] }
  post "/practices/:id/drills", to: "practices#add_drill"
  delete "/practices/:id/drills/:drill_id", to: "practices#remove_drill"
  root "dashboard#show"

  get "/signin", to: "sessions#new", as: :signin
  post "/signin", to: "sessions#create"
  get "/signout", to: "sessions#destroy", as: :signout
  get "/signup", to: "users#new", as: :signup

  resources :users, only: [:create, :update, :show]

  resources :drills
  resources :practices
  resources :teams
  resources :players
  resources :matches

  resources :squads do
    resources :players
  end
  resources :libraries do
    resource :drills
  end
end
