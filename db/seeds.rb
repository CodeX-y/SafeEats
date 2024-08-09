diet_types = [
  { name: "Vegan" },
  { name: "Vegetarian" },
  { name: "Halal" },
  { name: "Kosher" }
]

diet_types.each do |diet_type|
  unless DietType.where("LOWER(name) = ?", diet_type[:name].downcase).exists?
    DietType.create(diet_type)
    puts "Created DietType: #{diet_type[:name]}"
  else
    puts "DietType already exists: #{diet_type[:name]}"
  end
end

Rake::Task.clear
Rails.application.load_tasks

Rake::Task["db:slurp"].invoke
puts "Ran the slurp task"
