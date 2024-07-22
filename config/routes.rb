Rails.application.routes.draw do
  # Routes for the Diet compliance resource:

  # CREATE
  post("/insert_diet_compliance", { :controller => "diet_compliances", :action => "create" })
          
  # READ
  get("/diet_compliances", { :controller => "diet_compliances", :action => "index" })
  
  get("/diet_compliances/:path_id", { :controller => "diet_compliances", :action => "show" })
  
  # UPDATE
  
  post("/modify_diet_compliance/:path_id", { :controller => "diet_compliances", :action => "update" })
  
  # DELETE
  get("/delete_diet_compliance/:path_id", { :controller => "diet_compliances", :action => "destroy" })

  #------------------------------

  # Routes for the Ingredient resource:

  # CREATE
  post("/insert_ingredient", { :controller => "ingredients", :action => "create" })
          
  # READ
  get("/ingredients", { :controller => "ingredients", :action => "index" })
  
  get("/ingredients/:path_id", { :controller => "ingredients", :action => "show" })
  
  # UPDATE
  
  post("/modify_ingredient/:path_id", { :controller => "ingredients", :action => "update" })
  
  # DELETE
  get("/delete_ingredient/:path_id", { :controller => "ingredients", :action => "destroy" })

  #------------------------------

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
