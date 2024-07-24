require 'csv'

namespace :import do
  desc "Import ingredients from CSV file"
  task ingredients: :environment do
    file_path = Rails.root.join('db', 'ingredients.csv')

    CSV.foreach(file_path, headers: true) do |row|
      ingredient_data = row.to_h
      ingredient = Ingredient.new

      ingredient.name = ingredient_data["Ingredient"]
      ingredient.vegetarian = ingredient_data["Vegetarian"].downcase == 'true'
      ingredient.vegan = ingredient_data["Vegan"].downcase == 'true'

      ingredient.save
    end
  end
end
