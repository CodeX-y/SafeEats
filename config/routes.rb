Rails.application.routes.draw do
  devise_for :users
  
  root "landing_page#landing"
  
  resources :select_diet, only: [:edit, :update], param: :username
  resources :diet_types
  resources :ingredients
  # resources :products do
  #   post :get_barcode, on: :collection
  # end
  
  get "scanner" => "barcode#index"
  post "barcode" => "barcode#create"
  get "/food" => "compliance#food"
  get "/compliance" => "compliance#check_compliance"
end
