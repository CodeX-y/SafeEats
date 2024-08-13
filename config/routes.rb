Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks",
  }
  
  root "landing_page#landing"
  
  resources :select_diet, only: [:edit, :update], param: :username
  resources :diet_types
  resources :ingredients
  
  get "/food" => "compliance#food"
  get "/compliance" => "compliance#check_compliance"
end
