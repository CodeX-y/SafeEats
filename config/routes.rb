Rails.application.routes.draw do
  devise_for :users
  
  root "homepage#edit"
  
  resources :diet_types
  resources :homepage, only: [:edit, :update]
  resources :ingredients
  
  get "/safe" => "compliance#safe"
end
