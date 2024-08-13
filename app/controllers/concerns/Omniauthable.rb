module Omniauthable
  extend ActiveSupport::Concern

  included do
    def self.from_omniauth(auth)
      find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
        user.github_access_token = auth.credentials.token
        user.username = auth.info.nickname
      end
    end
  end
end
