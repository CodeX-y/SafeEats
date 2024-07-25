# == Schema Information
#
# Table name: user_diets
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  diet_id    :integer
#  user_id    :integer
#
class UserDiet < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  belongs_to :diet, required: true, class_name: "DietType", foreign_key: "diet_id"
end
