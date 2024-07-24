Rails.application.routes.draw do
  root "user_diets#new"

  devise_for :users

  resources :diet_compliances
  resources :ingredients
  resources :user_diets
  resources :diet_types

  # get "" => "user_diet#create"
  # get ":username" => "diet_types#index"
  # get ":username/diet" => "user_diets#index"
  # get ":username/ingredient" => "ingredients#index"

end
