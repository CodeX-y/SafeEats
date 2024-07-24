Rails.application.routes.draw do
  devise_for :users
  
  resources :diet_compliances
  resources :ingredients
  resources :user_diets
  resources :diet_types

  # root to: "home#index"
  
end
