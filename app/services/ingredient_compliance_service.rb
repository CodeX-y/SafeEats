class IngredientComplianceService
  def initialize(user, ingredients)
    @user = user
    @ingredients = ingredients
    set_diet_ids
  end

  def call
    @ingredients.all? do |ingredient_name|
      ingredient = Ingredient.where('LOWER(name) = ?', ingredient_name.downcase).first
      compliant?(ingredient)
    end
  end

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

  def compliant?(ingredient)
    return false unless ingredient

    case @user.diet_id
    when @vegan_diet_id
      ingredient.diet_id == @vegan_diet_id
    when @vegetarian_diet_id
      [@vegan_diet_id, @vegetarian_diet_id].include?(ingredient.diet_id)
    else
      false
    end
  end
end
