Rails.application.routes.draw do
  devise_for :users
  
  root "homepage#edit"
  
  resources :diet_types
  resources :homepage, only: [:edit, :update]
  resources :ingredients
  
  get "/check_ingredient" => "compliance#check"
  get "/safe" => "compliance#safe"
end
