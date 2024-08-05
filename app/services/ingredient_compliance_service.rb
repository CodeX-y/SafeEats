require 'httparty'

class IngredientComplianceService
  include HTTParty
  base_uri 'https://world.openfoodfacts.net/api/v0'

  def initialize(user, inputs)
    @user = user
    @inputs = inputs
    set_diet_ids
  end

  def call
    @inputs.all? do |input|
      ingredient = input_is_barcode?(input) ? fetch_ingredient_by_barcode(input) : fetch_ingredient_by_name(input)
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
      ingredient['diet_id'] == @vegan_diet_id
    when @vegetarian_diet_id
      [@vegan_diet_id, @vegetarian_diet_id].include?(ingredient['diet_id'])
    else
      false
    end
  end

  def input_is_barcode?(input)
    input.match?(/^\d+$/)
  end

  def fetch_ingredient_by_barcode(barcode)
    response = self.class.get("/product/#{barcode}.json")
    if response.success?
      response.parsed_response['product']
    else
      nil
    end
  rescue SocketError => e
    puts "Network error: #{e.message}"
    nil
  rescue HTTParty::Error => e
    puts "HTTP error: #{e.message}"
    nil
  rescue StandardError => e
    puts "General error: #{e.message}"
    nil
  end

  def fetch_ingredient_by_name(name)
    Ingredient.where('LOWER(name) = ?', name.downcase).first
  end
end
