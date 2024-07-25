# == Schema Information
#
# Table name: diet_compliances
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  diet_id       :integer
#  ingredient_id :integer
#
class DietCompliance < ApplicationRecord
  belongs_to :diet, required: true, class_name: "DietType", foreign_key: "diet_id"
  belongs_to :ingredient, required: true, class_name: "Ingredient", foreign_key: "ingredient_id"
end
