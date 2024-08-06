class SelectDietController < ApplicationController
  
  def edit
    @diet_types = DietType.all
    render "select_diet/edit"
  end

  def update
    current_user.diet_id = params["diet_id"]
    
    if current_user.save
      if current_user.instance_variable_get(:@diet_unselected)
        redirect_to edit_select_diet_path, alert: "Please select a diet before proceeding."
      else
        redirect_to check_ingredient_path
      end
    else
      @diet_types = DietType.all
      redirect_to edit_select_diet_path, alert: "There was an issue saving your selection. Please try again."
    end
  end
end
