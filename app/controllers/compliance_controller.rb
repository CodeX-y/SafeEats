class ComplianceController < ApplicationController
  before_action :check_diet_id, only: [:food, :check_compliance]

  def food
    if current_user.instance_variable_get(:@diet_unselected)
      redirect_to select_diet_path, alert: "Please select a diet before proceeding."
    end
  end

  def check_compliance
    ingredients_param = params["ingredients"]
    @ingredients = ingredients_param.present? ? ingredients_param.split(',').map(&:strip) : []

    if @ingredients.empty?
      redirect_to food_path, { :alert => "Please enter ingredients before proceeding." }
    else
      service = FoodComplianceService.new(current_user, @ingredients)
      @compliant = service.call

      if @compliant
        render "compliance/can_eat"
      else
        render "compliance/cant_eat"
      end
    end
  end

  private

  def check_diet_id
    if current_user.diet_id.blank?
      redirect_to select_diet_path, alert: "Please select a diet type before choosing a meal."
    end
  end
end
