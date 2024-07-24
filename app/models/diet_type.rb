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
  has_many  :user_diets, class_name: "UserDiet", foreign_key: "diet_id", dependent: :destroy
  has_many  :dietary_ingredient_rules, class_name: "DietCompliance", foreign_key: "diet_id", dependent: :destroy
end
