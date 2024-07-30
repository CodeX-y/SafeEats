Rails.application.routes.draw do
  resources :add_diet_id_to_users
  root "user_diets#new"

  devise_for :users
  
  resources :ingredients
  resources :user_diets
  resources :diet_types
  
  get "/safe" => "compliance#safe"
end
