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
end
