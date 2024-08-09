require "httparty"

class IngredientComplianceService
  include HTTParty
  base_uri "https://world.openfoodfacts.net/api/v0"

  DIETARY_KEYWORDS = {
    vegan: ["vegan"],
    vegetarian: ["vegetarian", "lacto-vegetarian"],
    halal: ["halal", "halalfoodauthority"],
    kosher: ["kosher", "hechsher"]
  }

  def initialize(user, inputs)
    @user = user
    @inputs = inputs
    set_diet_ids
  end

  def call
    @inputs.all? do |input|
      if input_is_barcode?(input)
        product = fetch_product_by_barcode(input)
        if product
          keywords = extract_keywords(product)
          tags = extract_ingredients_tags(product)
          compliant?(keywords + tags)
        else
          false
        end
      else
        ingredient = fetch_ingredient_by_name(input)
        compliant?(ingredient)
      end
    end
  end

  private

  def set_diet_ids
    vegan_diet = DietType.find_by("LOWER(name) = ?", "vegan")
    vegetarian_diet = DietType.find_by("LOWER(name) = ?", "vegetarian")
    halal_diet = DietType.find_by("LOWER(name) = ?", "halal")
    kosher_diet = DietType.find_by("LOWER(name) = ?", "kosher")

    @vegan_diet_id = vegan_diet&.id
    @vegetarian_diet_id = vegetarian_diet&.id
    @halal_diet_id = halal_diet&.id
    @kosher_diet_id = kosher_diet&.id
  end

  def compliant?(tags_or_ingredient)
    if tags_or_ingredient.is_a?(Array)
      case @user.diet_id
      when @vegan_diet_id
        tags_or_ingredient.any? { |keyword| keyword_matches?(keyword, :vegan) }
      when @vegetarian_diet_id
        tags_or_ingredient.any? { |keyword| keyword_matches?(keyword, :vegetarian) }
      when @halal_diet_id
        tags_or_ingredient.any? { |keyword| keyword_matches?(keyword, :halal) }
      when @kosher_diet_id
        tags_or_ingredient.any? { |keyword| keyword_matches?(keyword, :kosher) }
      else
        false
      end
    else
      return false unless tags_or_ingredient

      case @user.diet_id
      when @vegan_diet_id
        tags_or_ingredient["diet_id"] == @vegan_diet_id
      when @vegetarian_diet_id
        [@vegan_diet_id, @vegetarian_diet_id].include?(tags_or_ingredient["diet_id"])
      when @halal_diet_id
        [@vegan_diet_id, @vegetarian_diet_id, @halal_diet_id].include?(tags_or_ingredient["diet_id"])
      when @kosher_diet_id
        [@vegan_diet_id, @vegetarian_diet_id, @kosher_diet_id].include?(tags_or_ingredient["diet_id"])
      else
        false
      end
    end
  end

  def keyword_matches?(tag, diet_type)
    normalized_tag = tag.gsub(/^en:/, "")
    DIETARY_KEYWORDS[diet_type].any? { |keyword| normalized_tag == keyword }
  end

  def input_is_barcode?(input)
    input.match?(/^\d+$/)
  end

  def fetch_product_by_barcode(barcode)
    response = self.class.get("/product/#{barcode}.json")
    if response.success? && response.parsed_response["status"] == 1
      product = response.parsed_response["product"]
      product
    else
      puts "Failed to fetch product for barcode: #{barcode}"
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

  def extract_ingredients_tags(product)
    product["ingredients_analysis_tags"] || []
  end

  def extract_keywords(product)
    product["_keywords"] || []
  end

  def fetch_ingredient_by_name(name)
    ingredient = Ingredient.where("LOWER(name) = ?", name.downcase).first
    if ingredient
      puts "Fetched ingredient: #{ingredient}"
    else
      puts "Failed to fetch ingredient: #{name}"
    end
    ingredient
  end
end
