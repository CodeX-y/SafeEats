class ComplianceController < ApplicationController
  def safe
    ingredient = params[:ingredient]
    @found_ingredient = Ingredient.where("LOWER(name) = ?", ingredient.downcase).any?
    
    render "compliant/safe"
  end
end
