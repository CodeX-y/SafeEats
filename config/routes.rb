Rails.application.routes.draw do
  # root to: "users#user_diet"

  devise_for :users

  resources :diet_compliances
  resources :ingredients
  resources :user_diets
  resources :diet_types

  get ":username/diet" => "user_diets#index"
  get "diets" => "diet_types#index"
  get ":username/ingredient" => "ingredients#index"

end
