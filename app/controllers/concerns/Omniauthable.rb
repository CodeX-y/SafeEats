# Ruby filenames should be all lower_snake_case.rb
# This is a 'model' concern for User.rb. It should be in `app/models/concerns`.
#
# might want to adjust permissions being requested by GitHub
# it's requesting to read AND WRITE all user profile data on GitHub 😬
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
