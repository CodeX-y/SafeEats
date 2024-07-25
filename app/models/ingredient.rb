# == Schema Information
#
# Table name: ingredients
#
#  id         :integer          not null, primary key
#  name       :string
#  vegan      :boolean
#  vegetarian :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Ingredient < ApplicationRecord
  has_many  :dietary_ingredient_rules, class_name: "DietCompliance", foreign_key: "ingredient_id", dependent: :destroy
end
