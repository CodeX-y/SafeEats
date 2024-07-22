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
end
