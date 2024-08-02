class HomepageController < ApplicationController
  def edit
    @diet_types = DietType.all
    render "homepage/edit"
  end

  def update
    current_user.diet_id = params["diet_id"]
    
    if current_user.save
      if current_user.diet_id.present?
        redirect_to check_ingredient_path
      else
        @diet_types = DietType.all
        redirect_to edit_homepage_path, alert: "Please select your diet before proceeding."
      end
    else
      @diet_types = DietType.all
      redirect_to edit_homepage_path, alert: "There was an issue saving your selection. Please try again."
    end
  end

end
