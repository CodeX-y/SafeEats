# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
diet_types = [
  { name: 'Vegan' },
  { name: 'Vegetarian' },
  { name: 'Halal' },
  { name: 'Kosher' }
]

diet_types.each do |diet_type|
  unless DietType.where('LOWER(name) = ?', diet_type[:name].downcase).exists?
    DietType.create(diet_type)
    puts "Created DietType: #{diet_type[:name]}"
  else
    puts "DietType already exists: #{diet_type[:name]}"
  end
end

Rake::Task.clear
Rails.application.load_tasks

Rake::Task['db:slurp'].invoke
puts "Ran the slurp task"
