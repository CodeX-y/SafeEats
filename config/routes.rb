Rails.application.routes.draw do
  devise_for :users, controllers: {
    # don't need extra comma
    omniauth_callbacks: "omniauth_callbacks"
  }

  # landing_page#index
  root "landing_page#landing"

  resources :diet_types
  resources :ingredients

  # can use `resources :select_diet, only [:edit, :update]`
  get 'select_diet', to: 'select_diet#edit'
  patch 'select_diet', to: 'select_diet#update'

  # can use `resources :compliances` if you follow standard CRUD approach
  get "/food" => "compliance#food"
  get "/compliance" => "compliance#check_compliance"
end
