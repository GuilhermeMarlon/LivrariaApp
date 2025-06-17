Rails.application.routes.draw do
  
  root "users#index"

  resources :rentals
  resources :books
  resources :authors
  resources :users

  get "up" => "rails/health#show", as: :rails_health_check


end
