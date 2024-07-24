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
end
