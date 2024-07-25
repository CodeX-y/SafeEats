json.extract! user_diet, :id, :user_id, :diet_id, :created_at, :updated_at
json.url user_diet_url(user_diet, format: :json)
