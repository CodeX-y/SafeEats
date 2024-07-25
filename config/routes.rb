Rails.application.routes.draw do
  root to: "users#"

  devise_for :users

  resources :diet_compliances
  resources :ingredients
  resources :user_diets
  resources :diet_types

  get ":username/diet" => "user_diets#index", as: :user_diet
  get "diets" => "diet_types#index", as: :diets
  get ":username/ingredient" => "ingredients#index", as: :ingredient

end
