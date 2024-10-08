# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  github_access_token    :string
#  provider               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  uid                    :string
#  username               :string           default(""), not null
#  diet_id                :integer
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github]

  belongs_to :diet, required: false, class_name: "DietType", foreign_key: "diet_id"
  before_update :check_diet_id

  validates :username, presence: true, uniqueness: true

  include Omniauthable

  private

  def check_diet_id
    if diet_id.nil?
      @diet_unselected = true
    end
  end
end
