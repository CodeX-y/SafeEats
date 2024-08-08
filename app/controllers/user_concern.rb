module UserConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_user
  end

  private

  def set_user
    if params[:username]
      @user = User.find_by!(username: params[:username])
    else
      @user = current_user
    end
  end
end
