class ComplianceController < ApplicationController
  before_action only: [:check, :safe]

  def check
    render "compliant/ingredient"
  end

  def safe
    ingredients_param = params["ingredients"]
    @ingredients = ingredients_param.present? ? ingredients_param.split(',').map(&:strip) : []

    if @ingredients.empty?
      redirect_to check_ingredient_path, { :alert => "Please enter ingredients before proceeding." }
    else
      service = IngredientComplianceService.new(current_user, @ingredients)
      @compliant = service.call

      if @compliant
        render "compliant/can_eat"
      else
        render "compliant/cant_eat"
      end
    end
  end
end
