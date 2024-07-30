class HomepageController < ApplicationController
  before_action :authenticate_user!

  def edit
    @diet_types = DietType.all
    render "home/diet"
  end

  def update
    current_user.diet_id = params["diet_id"]
    if current_user.save
      redirect_to(safe_path)
    else
      @diet_types = DietType.all
      render "home/diet"
    end
  end

end
