Rails.application.routes.draw do
  devise_for :users
  
  root "landing_page#landing"
  
  resources :select_diet, only: [:edit, :update], param: :username
  resources :diet_types
  resources :ingredients
  
  get "/food" => "compliance#food"
  get "/compliance" => "compliance#check_compliance"
end
