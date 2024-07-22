Rails.application.routes.draw do
  # Routes for the Diet type resource:

  # CREATE
  post("/insert_diet_type", { :controller => "diet_types", :action => "create" })
          
  # READ
  get("/diet_types", { :controller => "diet_types", :action => "index" })
  
  get("/diet_types/:path_id", { :controller => "diet_types", :action => "show" })
  
  # UPDATE
  
  post("/modify_diet_type/:path_id", { :controller => "diet_types", :action => "update" })
  
  # DELETE
  get("/delete_diet_type/:path_id", { :controller => "diet_types", :action => "destroy" })

  #------------------------------

  devise_for :users

  # root to: "home#index"
  
end
