Rails.application.routes.draw do
  # resources :add_diet_id_to_users
  devise_for :users
  
  root "user#new"
  
  resources :ingredients
  resources :diet_types
  
  # get "" => "user/new"
  get "/safe" => "compliance#safe"
end
