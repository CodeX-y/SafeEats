class HomepageController < ApplicationController
  def edit
    @diet_types = DietType.all
    render "homepage/edit"
  end

  def update
    current_user.diet_id = params["diet_id"]
    if current_user.save
      redirect_to check_ingredient_path
    else
      @diet_types = DietType.all
      redirect_to root_path, alert: "Please select your diet before proceeding."
    end
  end

end
