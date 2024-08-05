# require_dependency 'services/ingredient_compliance_service'

class ComplianceController < ApplicationController
  before_action only: [:check, :safe]

  def check
    ingredients_param = params[:ingredients]
    if ingredients_param.present?
      @ingredients = ingredients_param.split(',').map(&:strip)

      render "compliant/ingredient"
    else
      # TODO: this line is causing an issue
      # redirect_to check_ingredient_path, alert: "Please add in your ingredients before proceeding."
      render "compliant/ingredient"
    end
  end

  def safe
    ingredients_param = params[:ingredients]
    @ingredients = ingredients_param.present? ? ingredients_param.split(',').map(&:strip) : []

    if @ingredients.empty?
      redirect_to check_ingredient_path, alert: "Please enter ingredients before proceeding."
    else
      @compliant = all_ingredients_compliant?(@ingredients)
      if @compliant
        render "compliant/can_eat"
      else
        render "compliant/cant_eat"
      end
    end
  end

  # def safe
  #   ingredients_param = params["ingredients"]
  #   @ingredients = ingredients_param.present? ? ingredients_param.split(',').map(&:strip) : []

  #   if @ingredients.empty?
  #     redirect_to check_ingredient_path, { :alert => "Please enter ingredients before proceeding." }
  #   else
  #     service = IngredientComplianceService.new(current_user, @ingredients)
  #     @compliant = service.call

  #     if @compliant
  #       render({ :template => "compliant/can_eat" })
  #     else
  #       render({ :template => "compliant/cant_eat" })
  #     end
  #   end
  # end

  private

  def set_diet_ids
    vegan_diet = DietType.find_by('LOWER(name) = ?', 'vegan')
    vegetarian_diet = DietType.find_by('LOWER(name) = ?', 'vegetarian')
    halal_diet = DietType.find_by('LOWER(name) = ?', 'halal')
    kosher_diet = DietType.find_by('LOWER(name) = ?', 'kosher')

    @vegan_diet_id = vegan_diet&.id
    @vegetarian_diet_id = vegetarian_diet&.id
    @halal_diet_id = halal_diet&.id
    @kosher_diet_id = kosher_diet&.id
  end

  def all_ingredients_compliant?(ingredients)
    user = current_user
    
    ingredients.all? do |ingredient_name|
      ingredient = Ingredient.find_by('LOWER(name) = ?', ingredient_name.downcase)
      return false unless ingredient

      if user.diet_id == @vegan_diet_id
        ingredient.diet_id == @vegan_diet_id
      elsif user.diet_id == @vegetarian_diet_id
        ingredient.diet_id == @vegan_diet_id || ingredient.diet_id == @vegetarian_diet_id
      else
        false
      end
    end
  end
end
