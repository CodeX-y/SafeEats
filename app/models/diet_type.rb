# == Schema Information
#
# Table name: diet_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class DietType < ApplicationRecord
  has_many  :userdiets, class_name: "UserDiet", foreign_key: "diet_id", dependent: :destroy
  has_many  :ingredients, class_name: "Ingredient", foreign_key: "diet_id", dependent: :destroy
end
