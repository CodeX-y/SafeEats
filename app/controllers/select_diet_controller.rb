class SelectDietController < ApplicationController
  
  
  def edit
    @diet_types = DietType.all
    render "select_diet/edit"
  end

  # def update
  #   current_user.diet_id = params["diet_id"]

  #   halal_diet = DietType.where('LOWER(name) = ?', 'halal').first
  #   kosher_diet = DietType.where('LOWER(name) = ?', 'kosher').first
    
  #   if current_user.save
  #     if current_user.diet_id.present?
  #       if current_user.diet_id == halal_diet&.id || current_user.diet_id == kosher_diet&.id
  #         redirect_to edit_select_diet_path, notice: "Halal and Kosher diets are not supported. Please select a different diet."
  #       else
  #         redirect_to check_ingredient_path
  #       end
  #     else
  #       @diet_types = DietType.all
  #       redirect_to edit_select_diet_path, alert: "Please select your diet before proceeding."
  #     end
  #   else
  #     @diet_types = DietType.all
  #     redirect_to edit_select_diet_path, alert: "There was an issue saving your selection. Please try again."
  #   end
  # end

  def update
    current_user.diet_id = params["diet_id"]
    
    if current_user.save
      if current_user.instance_variable_get(:@diet_unsupported)
        redirect_to edit_select_diet_path, notice: "Halal and Kosher diets are not supported. Please select a different diet."
      else
        redirect_to check_ingredient_path
      end
    else
      @diet_types = DietType.all
      redirect_to edit_select_diet_path, alert: "There was an issue saving your selection. Please try again."
    end
  end
end
