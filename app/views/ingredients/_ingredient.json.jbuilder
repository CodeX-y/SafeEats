json.extract! ingredient, :id, :name, :vegetarian, :vegan, :created_at, :updated_at
json.url ingredient_url(ingredient, format: :json)
