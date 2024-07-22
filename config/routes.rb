Rails.application.routes.draw do
  # Routes for the User diet resource:

  # CREATE
  post("/insert_user_diet", { :controller => "user_diets", :action => "create" })
          
  # READ
  get("/user_diets", { :controller => "user_diets", :action => "index" })
  
  get("/user_diets/:path_id", { :controller => "user_diets", :action => "show" })
  
  # UPDATE
  
  post("/modify_user_diet/:path_id", { :controller => "user_diets", :action => "update" })
  
  # DELETE
  get("/delete_user_diet/:path_id", { :controller => "user_diets", :action => "destroy" })

  #------------------------------

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
