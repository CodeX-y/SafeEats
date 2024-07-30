class ComplianceController < ApplicationController
  def check
    render "compliant/ingredient"
  end

  def safe
    @ingredient_name = params["ingredient"]
    @ingredient = Ingredient.where("LOWER(name) = ?", @ingredient_name.downcase).first

    vegan_diet = DietType.where({ :name => "vegan" }).first
    vegetarian_diet = DietType.where({ :name => "vegetarian" }).first

    @vegan_diet_id = vegan_diet ? vegan_diet.id : nil
    @vegetarian_diet_id = vegetarian_diet ? vegetarian_diet.id : nil
    
    render "compliant/safe"
  end
end
