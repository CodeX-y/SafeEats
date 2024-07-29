require 'csv'

namespace :db do
  desc "Fill the ingredients table from ingredients.csv"
  task :slurp => :environment do
    file_path = Rails.root.join('db', 'ingredients.csv')

    CSV.foreach(file_path, headers: true) do |row|
      diet_name = row["Diet Compliance"].strip.downcase
      diet_type = DietType.where("LOWER(name) = ?", diet_name).first_or_create({ :name => diet_name })

      ingredient_name = row["Ingredient"]
      ingredient = Ingredient.where({ :name => ingredient_name }).first_or_initialize
      ingredient.diet_id = diet_type.id
      ingredient.save
    end

    puts "Ingredients table has been filled from ingredients.csv"
  end
end
