# maybe CompliancesController with a 'Compliance' model
# this way you can track all the compliances that users are checking
# and you'll have a more standard CRUD actions: new, create, show, etc.
class ComplianceController < ApplicationController
  # good before_action 👍
  before_action :check_diet_id, only: [:food, :check_compliance]

  # new
  def food
  end

  # create
  def check_compliance
    ingredients_param = params["ingredients"]
    @ingredients = ingredients_param.present? ? ingredients_param.split(',').map(&:strip) : []

    if @ingredients.empty?
      redirect_to food_path, { :alert => "Please enter ingredients before proceeding." }
    else
      # might be more readable to have a strong domain driven approach `current_user.can_eat? @ingredients`
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
