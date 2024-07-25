Rails.application.routes.draw do
  root "user_diets#new"

  devise_for :users

  resources :diet_compliances
  resources :ingredients
  resources :user_diets
  resources :diet_types

end
