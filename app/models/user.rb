# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string           default(""), not null
#  diet_id                :integer
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :diet, required: false, class_name: "DietType", foreign_key: "diet_id"
  before_update :check_diet_id

  private

  def check_diet_id
    unsupported_diets = DietType.where('LOWER(name) IN (?)', ['halal', 'kosher'].map(&:downcase)).pluck(:id)
    
    if unsupported_diets.include?(diet_id)
      @diet_unsupported = true
    end
  end
end
