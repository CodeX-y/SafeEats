Rails.application.routes.draw do
  devise_for :users
  
  root "landing_page#landing"
  
  resources :homepage, only: [:edit, :update]
  resources :diet_types
  resources :ingredients
  
  get "/check_ingredient" => "compliance#check"
  get "/safe" => "compliance#safe"
end
